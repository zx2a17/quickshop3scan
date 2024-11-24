import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/list_item_repo.dart';
import '../../../router.dart';

class NewShoppingItemPage extends ConsumerStatefulWidget {
  const NewShoppingItemPage({required this.listId, super.key});
  final String listId;

  @override
  ConsumerState<NewShoppingItemPage> createState() => _NewShoppingItemPageState();
}

class _NewShoppingItemPageState extends ConsumerState<NewShoppingItemPage> {
  List<String> selectedCategories = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode quantityFocusNode = FocusNode();
  String? nameError;
  String? categoriesError;

  @override
  void initState() {
    super.initState();
    nameController.addListener(onNameChanges);
  }

  void onNameChanges() {
    if (nameError != null && nameController.text.isNotEmpty) {
      setState(() => nameError = null);
    }
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Item'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      autofocus: true,
                      focusNode: quantityFocusNode,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        labelText: 'Quantity (optional)',
                        hintText: 'Enter quantity',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(),
                        helperText:
                            'E.g. one, 2, 3 kg, four litres, 5 cans, two dozen, a few, several, or leave blank',
                        helperMaxLines: 2,
                      ),
                      controller: quantityController,
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      focusNode: nameFocusNode,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        labelText: 'Item name',
                        hintText: 'Enter item name',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        border: const OutlineInputBorder(),
                        errorText: nameError,
                        helperText:
                            'E.g. milk, tomato sauce, cucumbers, chicken thigh, sourdough bread',
                        helperMaxLines: 2,
                      ),
                      controller: nameController,
                    ),
                    const SizedBox(height: 28),
                    CategorySelector(
                      selectedCategories: selectedCategories,
                      onCategoriesChanged: (newCategories) {
                        selectedCategories = newCategories;
                        if (newCategories.isNotEmpty) {
                          categoriesError = null;
                        }
                        setState(() {});
                      },
                      error: categoriesError,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    if (_validate()) {
                      _saveItem();
                      final itemName = nameController.text;
                      nameController.clear();
                      selectedCategories.clear();
                      nameFocusNode.requestFocus();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Added $itemName to list'),
                        duration: const Duration(milliseconds: 2400),
                      ));
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add more'),
                ),
                TextButton.icon(
                  onPressed: () {
                    if (_validate()) {
                      _saveItem();
                      ref.read(routerProvider).pop();
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Done'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _validate() {
    nameError = nameController.text.isEmpty ? 'Please enter an item name' : null;
    categoriesError = selectedCategories.isEmpty ? 'Please select at least one category' : null;
    setState(() {});
    return ![nameError, categoriesError].any((err) => err != null);
  }

  void _saveItem() {
    ref.read(shoppingListItemRepoProvider(widget.listId).notifier).addItem(
          listId: widget.listId,
          itemName: nameController.text,
          quantity: quantityController.text,
          categories: selectedCategories,
        );
  }
}

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
    return InputDecorator(
      isFocused: focusNode?.hasFocus ?? false,
      decoration: InputDecoration(
        labelText: 'Categories',
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 4),
        errorText: widget.error,
        helperText:
            'E.g. dairy, sauces, fruit & vegetables, meat, bakery. These are the categories where you might find this item in store. We\'ll remember the categories for next time.',
        helperMaxLines: 3,
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
