import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/list_item_repo.dart';
import '../../../repositories/tooltips_repo.dart';
import '../../../router.dart';
import '../../../widgets/toggle_tooltip.dart';
import 'category_selector.dart';

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
    final showNameTooltip = ref.watch(tooltipsRepoProvider(TooltipType.shoppingItemName));
    final showQuantityTooltip = ref.watch(tooltipsRepoProvider(TooltipType.shoppingItemQuantity));
    final showCategoriesTooltip =
        ref.watch(tooltipsRepoProvider(TooltipType.shoppingItemCategories));
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Item'),
        actions: [
          if ([showNameTooltip, showQuantityTooltip, showCategoriesTooltip].any((e) => !e))
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () {
                ref
                    .read(tooltipsRepoProvider(TooltipType.shoppingItemName).notifier)
                    .setDisplayTooltip(true);
                ref
                    .read(tooltipsRepoProvider(TooltipType.shoppingItemQuantity).notifier)
                    .setDisplayTooltip(true);
                ref
                    .read(tooltipsRepoProvider(TooltipType.shoppingItemCategories).notifier)
                    .setDisplayTooltip(true);
              },
            )
        ],
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
                      ),
                      controller: quantityController,
                    ),
                    const ToggleTooltip(
                      type: TooltipType.shoppingItemQuantity,
                      message:
                          'E.g. one, 2, 3 kg, four litres, 5 cans, two dozen, a few, several, or leave blank',
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
                      ),
                      controller: nameController,
                    ),
                    const ToggleTooltip(
                      type: TooltipType.shoppingItemName,
                      message:
                          'E.g. milk, tomato sauce, cucumbers, chicken thigh, sourdough bread, paprika, fabric softener',
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
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Added $itemName to list'),
                        duration: const Duration(milliseconds: 2400),
                      ));
                      _resetPage();
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

  void _resetPage() {
    nameController.clear();
    quantityController.clear();
    selectedCategories.clear();
    quantityFocusNode.requestFocus();
  }
}
