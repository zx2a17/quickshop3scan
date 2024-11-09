import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'list_summary.freezed.dart';
part 'list_summary.g.dart';

@freezed
class ListSummary with _$ListSummary {
  const ListSummary._();

  const factory ListSummary({
    required String id,
    required String name,
    required String ownerId,
    required User owner,
    required List<String> editorIds,
    required List<User> editors,
    required int itemCount,

    /// When the list was last modified by a specific user, in milliseconds since the epoch.
    required Map<String, int> lastModified,
    required ListType listType,
  }) = _ListSummary;

  factory ListSummary.fromJson(Map<String, dynamic> json) => _$ListSummaryFromJson(json);
}

enum ListType {
  checklist,
  shoppingList,
}
