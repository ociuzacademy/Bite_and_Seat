// ignore_for_file: public_member_api_docs, sort_constructors_first

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
  final String? selectedCategory; // Change to nullable String
  final SelectCategory onSelectingCategory;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedCategory, // This can be null now
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
      hint: const Text(
        'Select a category',
      ), // Add a hint for when value is null
    );
  }
}
