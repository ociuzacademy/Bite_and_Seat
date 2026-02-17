// complaints_provider.dart
import 'dart:io';
import 'package:bite_and_seat/modules/complaints_module/classes/complaints_data.dart';
import 'package:flutter/material.dart';

class ComplaintsProvider with ChangeNotifier {
  String? _selectedCategory;
  List<File> _selectedImages = [];
  final TextEditingController _descriptionController = TextEditingController();

  // Getters
  String? get selectedCategory => _selectedCategory;
  List<File> get selectedImages => _selectedImages;
  TextEditingController get descriptionController => _descriptionController;

  // Setters
  void setCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setImages(List<File> images) {
    _selectedImages = images;
    notifyListeners();
  }

  void addImages(List<File> newImages) {
    _selectedImages.addAll(newImages);
    notifyListeners();
  }

  void removeImage(int index) {
    _selectedImages.removeAt(index);
    notifyListeners();
  }

  void clearAll() {
    _selectedCategory = null;
    _selectedImages.clear();
    _descriptionController.clear();
    notifyListeners();
  }

  // Validation
  bool get isFormValid {
    return _selectedCategory != null &&
        _selectedCategory!.isNotEmpty &&
        _descriptionController.text.length >= 10;
  }

  int get selectedImagesCount => _selectedImages.length;
  bool get canAddMoreImages => _selectedImages.length < 2;

  ComplaintsData? validateComplaintsData() {
    if (!isFormValid) {
      return null;
    }

    if (canAddMoreImages) {
      return null;
    }

    return ComplaintsData(
      category: _selectedCategory!,
      description: _descriptionController.text.trim(),
      images: _selectedImages,
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }
}
