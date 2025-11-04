// ignore_for_file: public_member_api_docs, sort_constructors_first

enum BookingType {
  tableOnly('TABLE_ONLY'),
  prebooked('PREBOOKED');

  final String label;
  const BookingType(this.label);

  @override
  String toString() => label;

  /// Return the label used for JSON or user-facing strings.
  String toJson() => label;

  /// Parse from a label (throws if not found).
  static BookingType fromLabel(String label) =>
      BookingType.values.firstWhere((e) => e.label == label);

  /// Safe parse from label. Returns null if not found.
  static BookingType? tryFromLabel(String? label) {
    if (label == null) return null;
    try {
      return BookingType.values.firstWhere((e) => e.label == label);
    } catch (_) {
      return null;
    }
  }

  /// Parse from JSON value; falls back to [tableOnly] when unknown.
  static BookingType fromJson(String? value) =>
      tryFromLabel(value) ?? BookingType.tableOnly;
}
