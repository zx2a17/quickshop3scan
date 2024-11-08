// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChecklistImpl _$$ChecklistImplFromJson(Map<String, dynamic> json) =>
    _$ChecklistImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      ownerId: json['ownerId'] as String,
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      editorIds:
          (json['editorIds'] as List<dynamic>).map((e) => e as String).toList(),
      editors: (json['editors'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ChecklistItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChecklistImplToJson(_$ChecklistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ownerId': instance.ownerId,
      'owner': instance.owner,
      'editorIds': instance.editorIds,
      'editors': instance.editors,
      'items': instance.items,
    };
