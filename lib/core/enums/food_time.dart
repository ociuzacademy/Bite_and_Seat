// ignore_for_file: public_member_api_docs, sort_constructors_first

enum FoodTime {
  breakfast('Breakfast'),
  lunch('Lunch'),
  eveningSnacks('Evening snack');

  final String label;
  const FoodTime(this.label);

  @override
  String toString() => label;

  /// Return the label used for JSON or user-facing strings.
  String toJson() => label;

  /// Parse from a label (throws if not found).
  static FoodTime fromLabel(String label) =>
      FoodTime.values.firstWhere((e) => e.label == label);

  /// Safe parse from label. Returns null if not found.
  static FoodTime? tryFromLabel(String? label) {
    if (label == null) return null;
    try {
      return FoodTime.values.firstWhere((e) => e.label == label);
    } catch (_) {
      return null;
    }
  }

  /// Parse from JSON value; falls back to [tableOnly] when unknown.
  static FoodTime fromJson(String? value) =>
      tryFromLabel(value) ?? FoodTime.breakfast;
}
