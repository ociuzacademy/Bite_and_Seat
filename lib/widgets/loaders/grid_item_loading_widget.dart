import 'package:flutter/material.dart';

class GridItemLoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius borderRadius;
  final Color baseColor;
  final Color highlightColor;

  const GridItemLoadingWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: borderRadius, color: baseColor),
    );
  }
}
