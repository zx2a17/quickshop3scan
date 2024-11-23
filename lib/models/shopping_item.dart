import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item.freezed.dart';

@freezed
class ShoppingItem with _$ShoppingItem {
  const ShoppingItem._();

  const factory ShoppingItem({
    required String path,
    required String name,
    required List<String> categories,
    required String addedByUserId,
    required bool completed,
  }) = _ShoppingItem;

  factory ShoppingItem.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    return ShoppingItem(
      path: doc.reference.path,
      name: doc['name'],
      categories: (doc['categories'] as List).cast<String>(),
      addedByUserId: doc['addedByUserId'],
      completed: doc[fieldKeys.completed],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'categories': categories,
      'addedByUserId': addedByUserId,
      fieldKeys.completed: completed,
    };
  }

  static const ShoppingItemFieldKeys fieldKeys = ShoppingItemFieldKeys();
}

class ShoppingItemFieldKeys {
  const ShoppingItemFieldKeys();
  final String completed = 'completed';
}
