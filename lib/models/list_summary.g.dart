// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListSummaryImpl _$$ListSummaryImplFromJson(Map<String, dynamic> json) =>
    _$ListSummaryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      ownerId: json['ownerId'] as String,
      editorIds:
          (json['editorIds'] as List<dynamic>).map((e) => e as String).toList(),
      editors: (json['editors'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemCount: (json['itemCount'] as num).toInt(),
      lastModified: Map<String, int>.from(json['lastModified'] as Map),
      listType: $enumDecode(_$ListTypeEnumMap, json['listType']),
    );

Map<String, dynamic> _$$ListSummaryImplToJson(_$ListSummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ownerId': instance.ownerId,
      'editorIds': instance.editorIds,
      'editors': instance.editors,
      'itemCount': instance.itemCount,
      'lastModified': instance.lastModified,
      'listType': _$ListTypeEnumMap[instance.listType]!,
    };

const _$ListTypeEnumMap = {
  ListType.checklist: 'checklist',
  ListType.shoppingList: 'shoppingList',
};
