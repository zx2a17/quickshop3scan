import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_item.freezed.dart';
part 'checklist_item.g.dart';

@freezed
class ChecklistItem with _$ChecklistItem {
  const ChecklistItem._();

  const factory ChecklistItem({
    required String name,
    required bool completed,
  }) = _ChecklistItem;

  factory ChecklistItem.fromJson(Map<String, dynamic> json) => _$ChecklistItemFromJson(json);
}
