// complaints_helper.dart
import 'dart:io';
import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/modules/complaints_module/classes/complaints_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:bite_and_seat/modules/complaints_module/providers/complaints_provider.dart';
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
      if (provider.selectedImages.isNotEmpty && !provider.canAddMoreImages) {
        final ComplaintsData? complaintsData = provider
            .validateComplaintsData();

        if (complaintsData != null) {
          final SubmitComplaintBloc submitComplaintBloc = context
              .read<SubmitComplaintBloc>();
          submitComplaintBloc.add(
            SubmitComplaintEvent.submittingComplaint(complaintsData),
          );
        }
      } else {
        CustomSnackbar.showError(context, message: 'Please upload 5 images.');
      }
    } else {
      CustomSnackbar.showError(
        context,
        message: 'Please fill all the required fields.',
      );
    }
  }

  void resetForm(ComplaintsProvider provider) {
    provider.clearAll();
    formKey.currentState?.reset();
  }
}
