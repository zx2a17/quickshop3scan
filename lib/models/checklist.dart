import 'package:freezed_annotation/freezed_annotation.dart';

import 'checklist_item.dart';
import 'user.dart';

part 'checklist.freezed.dart';
part 'checklist.g.dart';

@freezed
class Checklist with _$Checklist {
  const Checklist._();

  const factory Checklist({
    required String id,
    required String name,
    required String ownerId,
    required User owner,
    required List<String> editorIds,
    required List<User> editors,
    required List<ChecklistItem> items,
  }) = _Checklist;

  factory Checklist.fromJson(Map<String, dynamic> json) => _$ChecklistFromJson(json);
}
