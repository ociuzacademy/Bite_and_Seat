// complaint_category_dropdown.dart
import 'package:flutter/material.dart';
import 'package:bite_and_seat/modules/complaints_module/typedefs/select_category.dart';

class ComplaintCategoryDropdown extends StatelessWidget {
  const ComplaintCategoryDropdown({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelectingCategory,
  });

  final List<String> categories;
  final String? selectedCategory;
  final SelectCategory onSelectingCategory;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCategory,
      decoration: const InputDecoration(
        labelText: 'Complaint Category',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.category),
      ),
      items: categories.map((String category) {
        return DropdownMenuItem<String>(value: category, child: Text(category));
      }).toList(),
      onChanged: onSelectingCategory,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a category';
        }
        return null;
      },
      hint: const Text('Select a category'),
    );
  }
}
