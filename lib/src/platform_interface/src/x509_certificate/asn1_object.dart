import 'dart:typed_data';

import 'x509_certificate.dart';

import 'asn1_identifier.dart';
import 'oid.dart';

class CygnusASN1Object {
  /// This property contains the DER encoded object
  Uint8List? encoded;

  /// This property contains the decoded object whenever is possible
  dynamic value;

  CygnusASN1Identifier? identifier;

  List<CygnusASN1Object>? sub;

  CygnusASN1Object? parent;

  CygnusASN1Object? subAtIndex(int index) {
    if (sub != null && index >= 0 && index < sub!.length) {
      return sub![index];
    }
    return null;
  }

  CygnusASN1Object? firstSub() {
    if (subCount() > 0) {
      return sub!.first;
    }
    return null;
  }

  CygnusASN1Object? lastSub() {
    if (subCount() > 0) {
      return sub!.last;
    }
    return null;
  }

  int subCount() {
    return sub?.length ?? 0;
  }

  CygnusASN1Object? findOid({CygnusOID? oid, String? oidValue}) {
    oidValue = oid != null ? oid.toValue() : oidValue;
    for (var child in (sub ?? <CygnusASN1Object>[])) {
      if (child.identifier?.tagNumber() ==
          CygnusASN1IdentifierTagNumber.OBJECT_IDENTIFIER) {
        if (child.value == oidValue) {
          return child;
        }
      } else {
        var result = child.findOid(oidValue: oidValue);
        if (result != null) {
          return result;
        }
      }
    }
    return null;
  }

  String get description {
    return printAsn1();
  }

  String printAsn1({insets = ""}) {
    var output = insets;
    output += identifier?.description.toUpperCase() ?? "";
    output += (value != null ? ": $value" : "");
    if (identifier?.typeClass() == CygnusASN1IdentifierClass.UNIVERSAL &&
        identifier?.tagNumber() == CygnusASN1IdentifierTagNumber.OBJECT_IDENTIFIER) {
      var descr = CygnusOID.fromValue(value?.toString() ?? "")?.name();
      if (descr != null) {
        output += " ($descr)";
      }
    }
    output += sub != null && sub!.length > 0 ? " {" : "";
    output += "\n";
    for (var item in (sub ?? <CygnusASN1Object>[])) {
      output += item.printAsn1(insets: insets + "    ");
    }
    output += sub != null && sub!.length > 0 ? "}\n" : "";
    return output;
  }

  @override
  String toString() {
    return description;
  }

  CygnusASN1Object? atIndex(CygnusX509BlockPosition x509blockPosition) {
    if (sub != null && x509blockPosition.index < sub!.length) {
      return sub![x509blockPosition.index];
    }
    return null;
  }

  String? get asString {
    if (value is String) {
      return value;
    }

    if (sub != null && sub!.length > 0) {
      for (var item in sub!) {
        var itemAsString = item.asString;
        if (itemAsString != null) {
          return itemAsString;
        }
      }
    }

    return null;
  }
}
