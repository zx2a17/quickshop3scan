// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingItemImpl _$$ShoppingItemImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingItemImpl(
      name: json['name'] as String,
      category: json['category'] as String,
      addedByUserId: json['addedByUserId'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$ShoppingItemImplToJson(_$ShoppingItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'addedByUserId': instance.addedByUserId,
      'completed': instance.completed,
    };
