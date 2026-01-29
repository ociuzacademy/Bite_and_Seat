// ignore_for_file: public_member_api_docs, sort_constructors_first

enum BookingMethod {
  table('table'),
  both('both');

  final String label;
  const BookingMethod(this.label);

  @override
  String toString() => label;

  /// Return the label used for JSON or user-facing strings.
  String toJson() => label;

  /// Parse from a label (throws if not found).
  static BookingMethod fromLabel(String label) =>
      BookingMethod.values.firstWhere((e) => e.label == label);

  /// Safe parse from label. Returns null if not found.
  static BookingMethod? tryFromLabel(String? label) {
    if (label == null) return null;
    try {
      return BookingMethod.values.firstWhere((e) => e.label == label);
    } catch (_) {
      return null;
    }
  }

  /// Parse from JSON value; falls back to [tableOnly] when unknown.
  static BookingMethod fromJson(String? value) =>
      tryFromLabel(value) ?? BookingMethod.table;
}
