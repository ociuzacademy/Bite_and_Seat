// ignore_for_file: public_member_api_docs, sort_constructors_first

enum PaymentMethod {
  upi('upi'),
  card('card');

  final String label;
  const PaymentMethod(this.label);

  @override
  String toString() => label;

  /// Return the label used for JSON or user-facing strings.
  String toJson() => label;

  /// Parse from a label (throws if not found).
  static PaymentMethod fromLabel(String label) =>
      PaymentMethod.values.firstWhere((e) => e.label == label);

  /// Safe parse from label. Returns null if not found.
  static PaymentMethod? tryFromLabel(String? label) {
    if (label == null) return null;
    try {
      return PaymentMethod.values.firstWhere((e) => e.label == label);
    } catch (_) {
      return null;
    }
  }

  /// Parse from JSON value; falls back to [tableOnly] when unknown.
  static PaymentMethod fromJson(String? value) =>
      tryFromLabel(value) ?? PaymentMethod.upi;
}
