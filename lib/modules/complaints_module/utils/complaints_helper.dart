// complaints_helper.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:bite_and_seat/modules/complaints_module/providers/complaints_provider.dart';
import 'package:bite_and_seat/modules/menu_module/view/menu_page.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class ComplaintsHelper {
  final BuildContext context;
  final GlobalKey<FormState> formKey;

  ComplaintsHelper({required this.context, required this.formKey});

  Future<void> pickImages(ComplaintsProvider provider) async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      final List<XFile> pickedFiles = await imagePicker.pickMultiImage(
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 80,
      );

      if (pickedFiles.isNotEmpty) {
        if (provider.selectedImagesCount + pickedFiles.length <= 5) {
          provider.addImages(
            pickedFiles.map((xFile) => File(xFile.path)).toList(),
          );
        } else {
          if (!context.mounted) return;
          CustomSnackbar.showError(
            context,
            message: 'You can only select up to 5 images',
          );
        }
      }
    } catch (e) {
      if (!context.mounted) return;
      CustomSnackbar.showError(context, message: 'Failed to pick images: $e');
    }
  }

  void removeImage(ComplaintsProvider provider, int index) {
    provider.removeImage(index);
  }

  void submitComplaint(ComplaintsProvider provider) {
    if (formKey.currentState!.validate()) {
      // Here you would typically send the complaint to your backend
      debugPrint('Complaint submitted:');
      debugPrint('Category: ${provider.selectedCategory}');
      debugPrint('Description: ${provider.descriptionController.text}');
      debugPrint('Number of images: ${provider.selectedImagesCount}');

      // Show success message
      CustomSnackbar.showSuccess(
        context,
        message: 'Complaint submitted successfully!',
      );

      // Clear the form
      resetForm(provider);

      // Navigate to Menu page
      Navigator.of(context).push(MenuPage.route());
    }
  }

  void resetForm(ComplaintsProvider provider) {
    provider.clearAll();
    formKey.currentState?.reset();
  }
}
