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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Item'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: nameController,
              ),
              const SizedBox(height: 16),
              Wrap(
                children:
                    selectedCategories.map((category) => Chip(label: Text(category))).toList(),
              ),
              Autocomplete(
                optionsBuilder: (textEditingValue) {
                  return categorySuggestions.where((String option) {
                    return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                optionsViewBuilder: (context, onSelected, options) {
                  return Material(
                    elevation: 4,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),
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
                  );
                },
                onSelected: (option) => setState(() => selectedCategories.add(option)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(shoppingListItemRepoProvider(widget.listId).notifier).addItem(
                        listId: widget.listId,
                        itemName: nameController.text,
                        categories: selectedCategories,
                      );
                  ref.read(routerProvider).pop();
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
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
