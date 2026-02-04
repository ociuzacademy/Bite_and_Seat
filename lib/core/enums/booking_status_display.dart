import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

enum BookingStatusDisplay {
  pending('Pending', AppPalette.pendingColor, Color(0xFFFFE0B2)),
  confirmed('Confirmed', AppPalette.firstColor, Color(0xFFC8E6C9)),
  cancelled('Cancelled', AppPalette.errorColor, Color(0xFFFFCDD2)),
  completed('Completed', AppPalette.firstColor, AppPalette.secondColor);

  final String label;
  final Color color;
  final Color containerColor;
  const BookingStatusDisplay(this.label, this.color, this.containerColor);

  @override
  String toString() => label;

  /// Return the label used for JSON or user-facing strings.
  String toJson() => label;

  /// Parse from a label (throws if not found).
  static BookingStatusDisplay fromLabel(String label) =>
      BookingStatusDisplay.values.firstWhere((e) => e.label == label);

  /// Safe parse from label. Returns null if not found.
  static BookingStatusDisplay? tryFromLabel(String? label) {
    if (label == null) return null;
    try {
      return BookingStatusDisplay.values.firstWhere((e) => e.label == label);
    } catch (_) {
      return null;
    }
  }

  /// Parse from JSON value; falls back to [tableOnly] when unknown.
  static BookingStatusDisplay fromJson(String? value) =>
      tryFromLabel(value) ?? BookingStatusDisplay.pending;
}
