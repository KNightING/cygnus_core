// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_menu_item.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represent an item of the [CygnusContextMenu].
class CygnusContextMenuItem {
  ///Menu item action that will be called when an user clicks on it.
  dynamic Function()? action;

  ///Use [id] instead.
  @Deprecated('Use id instead')
  int? androidId;

  ///Menu item ID. It cannot be `null` and it can be a [String] or an [int].
  ///
  ///**NOTE for Android**: it must be an [int] value.
  dynamic id;

  ///Use [id] instead.
  @Deprecated('Use id instead')
  String? iosId;

  ///Menu item title.
  String title;
  CygnusContextMenuItem({
    this.id,
    @Deprecated("Use id instead") this.androidId,
    @Deprecated("Use id instead") this.iosId,
    required this.title,
    this.action,
  }) {
    if (Util.isAndroid) {
      this.id = this.id ?? this.androidId;
      assert(this.id is int);
    } else if (Util.isIOS) {
      this.id = this.id ?? this.iosId;
    }
    assert(this.id != null && (this.id is int || this.id is String));
  }

  ///Gets a possible [CygnusContextMenuItem] instance from a [Map] value.
  static CygnusContextMenuItem? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusContextMenuItem(
      androidId: map['id'],
      id: map['id'],
      iosId: map['id'],
      title: map['title'],
    );
    return instance;
  }

  @ExchangeableObjectMethod(toMapMergeWith: true)
  Map<String, dynamic> _toMapMergeWith({CygnusEnumMethod? enumMethod}) {
    return {"androidId": androidId, "iosId": iosId};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "id": id,
      "title": title,
      ..._toMapMergeWith(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusContextMenuItem{id: $id, title: $title}';
  }
}
