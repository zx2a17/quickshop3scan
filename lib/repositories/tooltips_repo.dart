import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/shared_preferences.dart';

part 'tooltips_repo.g.dart';

enum TooltipType {
  shoppingItemQuantity,
  shoppingItemName,
  shoppingItemCategories,
}

@riverpod
class TooltipsRepo extends _$TooltipsRepo {
  @override
  bool build(TooltipType type) {
    final prefs = ref.watch(sharedPrefsProvider);
    return prefs.getBool(type.keyName) ?? true;
  }

  void setDisplayTooltip(bool value) {
    final prefs = ref.read(sharedPrefsProvider);
    prefs.setBool(type.keyName, value);
    state = value;
  }
}

extension on TooltipType {
  String get keyName => 'tooltips.$name';
}
