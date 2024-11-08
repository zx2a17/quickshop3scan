import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item.freezed.dart';
part 'shopping_item.g.dart';

@freezed
class ShoppingItem with _$ShoppingItem {
  const ShoppingItem._();

  const factory ShoppingItem({
    required String name,
    required String category,
    required String addedByUserId,
    required bool completed,
  }) = _ShoppingItem;

  factory ShoppingItem.fromJson(Map<String, dynamic> json) => _$ShoppingItemFromJson(json);
}
