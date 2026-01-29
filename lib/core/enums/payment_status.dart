// ignore_for_file: public_member_api_docs, sort_constructors_first

enum PaymentStatus {
  pending('pending'),
  paid('paid');

  final String label;
  const PaymentStatus(this.label);

  @override
  String toString() => label;

  /// Return the label used for JSON or user-facing strings.
  String toJson() => label;

  /// Parse from a label (throws if not found).
  static PaymentStatus fromLabel(String label) =>
      PaymentStatus.values.firstWhere((e) => e.label == label);

  /// Safe parse from label. Returns null if not found.
  static PaymentStatus? tryFromLabel(String? label) {
    if (label == null) return null;
    try {
      return PaymentStatus.values.firstWhere((e) => e.label == label);
    } catch (_) {
      return null;
    }
  }

  /// Parse from JSON value; falls back to [tableOnly] when unknown.
  static PaymentStatus fromJson(String? value) =>
      tryFromLabel(value) ?? PaymentStatus.pending;
}
