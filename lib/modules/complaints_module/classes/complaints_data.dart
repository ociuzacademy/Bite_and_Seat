// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class ComplaintsData {
  final String category;
  final String description;
  final List<File> images;
  const ComplaintsData({
    required this.category,
    required this.description,
    required this.images,
  });
}
