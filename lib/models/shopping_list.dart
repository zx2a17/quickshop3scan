import 'package:freezed_annotation/freezed_annotation.dart';

import 'shopping_item.dart';
import 'user.dart';

part 'shopping_list.freezed.dart';
part 'shopping_list.g.dart';

@freezed
class ShoppingList with _$ShoppingList {
  const ShoppingList._();

  const factory ShoppingList({
    required String id,
    required String name,
    required String ownerId,
    required User owner,
    required List<String> editorIds,
    required List<User> editors,
    required List<ShoppingItem> items,
  }) = _ShoppingList;

  factory ShoppingList.fromJson(Map<String, dynamic> json) => _$ShoppingListFromJson(json);
}
