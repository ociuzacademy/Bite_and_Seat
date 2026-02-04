// ignore_for_file: public_member_api_docs, sort_constructors_first

enum BookingStatus {
  pending('pending'),
  confirmed('confirmed'),
  cancelled('cancelled'),
  completed('completed');

  final String label;
  const BookingStatus(this.label);

  @override
  String toString() => label;

  /// Return the label used for JSON or user-facing strings.
  String toJson() => label;

  /// Parse from a label (throws if not found).
  static BookingStatus fromLabel(String label) =>
      BookingStatus.values.firstWhere((e) => e.label == label);

  /// Safe parse from label. Returns null if not found.
  static BookingStatus? tryFromLabel(String? label) {
    if (label == null) return null;
    try {
      return BookingStatus.values.firstWhere((e) => e.label == label);
    } catch (_) {
      return null;
    }
  }

  /// Parse from JSON value; falls back to [tableOnly] when unknown.
  static BookingStatus fromJson(String? value) =>
      tryFromLabel(value) ?? BookingStatus.pending;
}
