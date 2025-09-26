// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:bite_and_seat/modules/menu_module/view/menu_page.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class ComplaintsHelper {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController descriptionController;
  final ValueNotifier<String?> selectedCategory;
  final ValueNotifier<List<File>> selectedImages;
  ComplaintsHelper({
    required this.context,
    required this.formKey,
    required this.descriptionController,
    required this.selectedCategory,
    required this.selectedImages,
  });

  Future<void> pickImages() async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      final List<XFile> pickedFiles = await imagePicker.pickMultiImage(
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 80,
      );

      if (pickedFiles.isNotEmpty) {
        // Create a new list and update the ValueNotifier
        final newList = List<File>.from(selectedImages.value);
        newList.addAll(pickedFiles.map((xFile) => File(xFile.path)));
        selectedImages.value =
            newList; // This triggers the ValueListenableBuilder
      }
    } catch (e) {
      if (!context.mounted) return;
      CustomSnackbar.showError(context, message: 'Failed to pick images: $e');
    }
  }

  void removeImage(int index) {
    final newList = List<File>.from(selectedImages.value);
    newList.removeAt(index);
    selectedImages.value = newList; // This triggers the ValueListenableBuilder
  }

  void submitComplaint() {
    if (formKey.currentState!.validate()) {
      // Here you would typically send the complaint to your backend
      debugPrint('Complaint submitted:');
      debugPrint('Category: ${selectedCategory.value}');
      debugPrint('Description: ${descriptionController.text}');
      debugPrint('Number of images: ${selectedImages.value.length}');

      // Show success message
      CustomSnackbar.showSuccess(
        context,
        message: 'Complaint submitted successfully!',
      );

      // Clear the form
      resetForm();

      // Navigate to Menu page
      Navigator.of(context).push(MenuPage.route());
    }
  }

  void resetForm() {
    descriptionController.clear();
    selectedCategory.value = null;
    formKey.currentState?.reset();
    selectedImages.value = []; // This triggers the ValueListenableBuilder
  }
}
