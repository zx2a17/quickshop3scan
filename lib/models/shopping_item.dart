import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item.freezed.dart';

@freezed
class ShoppingItem with _$ShoppingItem {
  const ShoppingItem._();

  const factory ShoppingItem({
    required String name,
    required String category,
    required String addedByUserId,
    required bool completed,
  }) = _ShoppingItem;
}
