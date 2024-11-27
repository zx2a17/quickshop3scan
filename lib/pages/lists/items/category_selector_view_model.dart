import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_selector_view_model.freezed.dart';
part 'category_selector_view_model.g.dart';

@freezed
class CategorySelectorItem with _$CategorySelectorItem {
  const CategorySelectorItem._();

  const factory CategorySelectorItem.newCategory() = _NewCategory;
  const factory CategorySelectorItem.heading(String name) = _Heading;
  const factory CategorySelectorItem.suggestion(String name) = _Suggestion;
  const factory CategorySelectorItem.history(String name) = _History;
}

@riverpod
class CategoryFilter extends _$CategoryFilter {
  @override
  String build() {
    return "";
  }

  void setFilter(String filter) {
    state = filter;
  }
}

@riverpod
CategorySelectorViewModel categorySelectorViewModel(Ref ref) {
  return CategorySelectorViewModel._(ref);
}

class CategorySelectorViewModel {
  final Ref _ref;
  CategorySelectorViewModel._(this._ref);

  Future<List<CategorySelectorItem>> getItems(String filter) async {
    final categorySuggestions = _ref.watch(categorySuggestionsProvider);
    await Future.delayed(const Duration(milliseconds: 100));
    if (filter.isEmpty) {
      return categorySuggestions
          .map((suggestion) => CategorySelectorItem.suggestion(suggestion))
          .toList();
    }
    final suggestions = categorySuggestions
        .where((suggestion) => suggestion.toLowerCase().contains(filter.toLowerCase()))
        .map((suggestion) => CategorySelectorItem.suggestion(suggestion))
        .toList();
    if (suggestions.isEmpty || filter.length > 3) {
      suggestions.insert(0, const CategorySelectorItem.newCategory());
    }
    return suggestions;
  }
}

@riverpod
List<String> categorySuggestions(Ref ref) {
  return [
    'Fruit and Vegetables',
    'Dairy',
    'Meat',
    'Laundry',
    'Cleaning',
    'Pasta',
    'Soft Drinks',
    'Pantry',
    'Frozen',
    'Bakery',
    'Snacks',
    'Beverages',
    'Household',
    'Personal Care',
    'Pet',
  ];
}
