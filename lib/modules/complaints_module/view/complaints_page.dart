// complaints_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/complaints_module/providers/complaints_provider.dart';
import 'package:bite_and_seat/modules/complaints_module/utils/complaints_helper.dart';
import 'package:bite_and_seat/modules/complaints_module/widgets/complaint_category_dropdown.dart';
import 'package:bite_and_seat/widgets/buttons/custom_button.dart';
import 'package:bite_and_seat/widgets/text_fields/normal_text_field.dart';

class ComplaintsPage extends StatefulWidget {
  const ComplaintsPage({super.key});

  @override
  State<ComplaintsPage> createState() => _ComplaintsPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const ComplaintsPage());
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  late final ComplaintsHelper _complaintsHelper;
  final _formKey = GlobalKey<FormState>();

  static const List<String> _categories = [
    'General',
    'Technical',
    'Billing',
    'Service',
    'Safety',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _complaintsHelper = ComplaintsHelper(context: context, formKey: _formKey);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ComplaintsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Submit a Complaint'),
          titleTextStyle: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppPalette.whiteColor),
          backgroundColor: AppPalette.firstColor,
          iconTheme: const IconThemeData(color: AppPalette.whiteColor),
        ),
        body: Consumer<ComplaintsProvider>(
          builder: (context, complaintsProvider, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category Dropdown
                    ComplaintCategoryDropdown(
                      categories: _categories,
                      selectedCategory: complaintsProvider.selectedCategory,
                      onSelectingCategory: (value) {
                        complaintsProvider.setCategory(value);
                      },
                    ),
                    const SizedBox(height: 20),

                    // Description Field
                    NormalTextField(
                      textEditingController:
                          complaintsProvider.descriptionController,
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'You can upload up to 5 images to support your complaint',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 15),

                    // Upload Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: complaintsProvider.canAddMoreImages
                            ? () => _complaintsHelper.pickImages(
                                complaintsProvider,
                              )
                            : null,
                        icon: const Icon(Icons.photo_library),
                        label: Text(
                          complaintsProvider.canAddMoreImages
                              ? 'Select Images (${complaintsProvider.selectedImagesCount}/5)'
                              : 'Maximum 5 images reached',
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Selected Images Preview
                    if (complaintsProvider.selectedImages.isNotEmpty) ...[
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
                        itemCount: complaintsProvider.selectedImages.length,
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
                                    complaintsProvider.selectedImages[index],
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
                                  onTap: () => _complaintsHelper.removeImage(
                                    complaintsProvider,
                                    index,
                                  ),
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
                        'Tap the X icon to remove an image',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                    const SizedBox(height: 30),

                    // Submit Button
                    CustomButton(
                      buttonWidth: double.infinity,
                      backgroundColor: AppPalette.firstColor,
                      textColor: AppPalette.whiteColor,
                      labelText: 'Submit Complaint',
                      onClick: () =>
                          _complaintsHelper.submitComplaint(complaintsProvider),
                    ),
                    const SizedBox(height: 10),

                    // Reset Button
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () =>
                            _complaintsHelper.resetForm(complaintsProvider),
                        child: const Text(
                          'Clear Form',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
