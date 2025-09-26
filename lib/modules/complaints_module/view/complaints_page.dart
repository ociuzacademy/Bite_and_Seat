// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/complaints_module/widgets/complaint_category_dropdown.dart';
import 'package:bite_and_seat/widgets/buttons/custom_button.dart';
import 'package:bite_and_seat/widgets/text_fields/normal_text_field.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/modules/complaints_module/utils/complaints_helper.dart';

class ComplaintsPage extends StatefulWidget {
  const ComplaintsPage({super.key});

  @override
  State<ComplaintsPage> createState() => _ComplaintsPageState();

  static route() => MaterialPageRoute(builder: (context) => ComplaintsPage());
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  late final ComplaintsHelper _complaintsHelper;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();

  final ValueNotifier<String?> _selectedCategory = ValueNotifier<String?>(null);
  static const List<String> _categories = [
    'General',
    'Technical',
    'Billing',
    'Service',
    'Safety',
    'Other',
  ];

  final ValueNotifier<List<File>> _selectedImages = ValueNotifier<List<File>>(
    [],
  );

  @override
  void initState() {
    super.initState();
    _complaintsHelper = ComplaintsHelper(
      context: context,
      formKey: _formKey,
      descriptionController: _descriptionController,
      selectedCategory: _selectedCategory,
      selectedImages: _selectedImages,
    );

    // Add listener to force UI updates when images change
    _selectedImages.addListener(_onImagesChanged);
  }

  void _onImagesChanged() {
    setState(() {
      // This will force the UI to rebuild when images change
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _selectedCategory.dispose();
    _selectedImages.removeListener(_onImagesChanged);
    _selectedImages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit a Complaint'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Dropdown
              ValueListenableBuilder(
                valueListenable: _selectedCategory,
                builder: (context, selectedCategory, child) {
                  return ComplaintCategoryDropdown(
                    categories: _categories,
                    selectedCategory: selectedCategory,
                    onSelectingCategory: (value) {
                      _selectedCategory.value = value;
                    },
                  );
                },
              ),
              const SizedBox(height: 20),

              // Description Field
              NormalTextField(
                textEditingController: _descriptionController,
                labelText: 'Complaint Description',
                hintText: 'Please describe your complaint in detail...',
                validatorFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe your complaint';
                  }
                  if (value.length < 10) {
                    return 'Please provide more details (at least 10 characters)';
                  }
                  return null;
                },
                isMultiline: true,
              ),
              const SizedBox(height: 20),

              // Image Upload Section
              const Text(
                'Attach Images',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'You can upload up to 5 images to support your complaint',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 15),

              // Upload Button - Use ValueListenableBuilder for image count
              ValueListenableBuilder(
                valueListenable: _selectedImages,
                builder: (context, selectedImages, child) {
                  return SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: selectedImages.length >= 5
                          ? null
                          : _complaintsHelper.pickImages,
                      icon: const Icon(Icons.photo_library),
                      label: Text(
                        selectedImages.length >= 5
                            ? 'Maximum 5 images reached'
                            : 'Select Images (${selectedImages.length}/5)',
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),

              // Selected Images Preview - Use ValueListenableBuilder for images
              ValueListenableBuilder(
                valueListenable: _selectedImages,
                builder: (context, selectedImages, child) {
                  if (selectedImages.isEmpty) {
                    return const SizedBox(); // Return empty container when no images
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Selected Images:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1,
                            ),
                        itemCount: selectedImages.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    selectedImages[index],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 4,
                                right: 4,
                                child: GestureDetector(
                                  onTap: () =>
                                      _complaintsHelper.removeImage(index),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 4,
                                left: 4,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Tap the × icon to remove an image',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 30),

              // Submit Button
              CustomButton(
                buttonWidth: double.infinity,
                backgroundColor: AppPalette.firstColor,
                textColor: AppPalette.whiteColor,
                labelText: 'Submit Complaint',
                onClick: _complaintsHelper.submitComplaint,
              ),
              const SizedBox(height: 10),

              // Reset Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: _complaintsHelper.resetForm,
                  child: const Text(
                    'Clear Form',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
