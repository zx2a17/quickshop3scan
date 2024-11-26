import 'package:flutter/material.dart';

import '../../../repositories/tooltips_repo.dart';
import '../../../widgets/toggle_tooltip.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({
    required this.selectedCategories,
    required this.onCategoriesChanged,
    required this.error,
    super.key,
  });
  final List<String> selectedCategories;
  final void Function(List<String>) onCategoriesChanged;
  final String? error;

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  TextEditingController? controller;
  FocusNode? focusNode;

  void onBuildField(TextEditingController controller, FocusNode focusNode) {
    if (controller != this.controller) {
      this.controller = controller;
    }
    if (focusNode != this.focusNode) {
      this.focusNode?.removeListener(onFocusChanged);
      this.focusNode = focusNode;
      this.focusNode?.addListener(onFocusChanged);
    }
  }

  void onFocusChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    focusNode?.removeListener(onFocusChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InputDecorator(
          isFocused: focusNode?.hasFocus ?? false,
          decoration: InputDecoration(
            labelText: 'Categories',
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 4),
            errorText: widget.error,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              widget.selectedCategories.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'No categories selected',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Wrap(
                      spacing: 8,
                      children: widget.selectedCategories
                          .map((category) => Chip(
                                label: Text(category),
                                onDeleted: () => widget.onCategoriesChanged(
                                    List.from(widget.selectedCategories)..remove(category)),
                              ))
                          .toList(),
                    ),
              LayoutBuilder(builder: (context, constraints) {
                return Autocomplete(
                  optionsBuilder: (textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    }
                    return categorySuggestions.where((String option) {
                      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                    onBuildField(textEditingController, focusNode);
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      onFieldSubmitted: (String value) {
                        onFieldSubmitted();
                      },
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        hintText: 'Enter category name',
                        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                        border: InputBorder.none,
                      ),
                    );
                  },
                  optionsViewBuilder: (context, onSelected, options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200, maxWidth: constraints.maxWidth),
                        child: Material(
                          elevation: 4,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final String option = options.elementAt(index);
                              return ListTile(
                                title: Text(option),
                                onTap: () {
                                  onSelected(option);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  onSelected: (category) {
                    widget.onCategoriesChanged(List.from(widget.selectedCategories)..add(category));
                    controller?.clear();
                  },
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const ToggleTooltip(
          type: TooltipType.shoppingItemCategories,
          message:
              'E.g. dairy, sauces, fruit & vegetables, meat, bakery, herbs and spices, laundry. These are the categories where you might find this item in store.',
        ),
      ],
    );
  }
}

final List<String> itemSuggestions = [
  'Apples',
  'Bananas',
  'Oranges',
  'Pears',
  'Potatoes',
  'Carrots',
  'Broccoli',
  'Tomatoes',
  'Lettuce',
  'Cucumbers',
  'Onions',
  'Garlic',
  'Peppers',
  'Milk',
  'Bread',
  'Eggs',
  'Butter',
  'Cheese',
  'Yogurt',
  'Chicken',
  'Chicken breast',
  'Chicken thigh',
  'Beef',
  'Pork',
  'Fish',
  'Rice',
  'Pasta',
  'Applesauce',
  'Peanut Butter',
  'Jelly',
  'Cereal',
  'Oatmeal',
  'Granola Bars',
  'Chips',
  'Salsa',
  'Cookies',
  'Crackers',
  'Popcorn',
  'Ice Cream',
  'Frozen Pizza',
];

final List<String> categorySuggestions = [
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
