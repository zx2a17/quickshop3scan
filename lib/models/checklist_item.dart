import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_item.freezed.dart';

@freezed
class ChecklistItem with _$ChecklistItem {
  const ChecklistItem._();

  const factory ChecklistItem({
    required String name,
    required bool completed,
  }) = _ChecklistItem;
}
