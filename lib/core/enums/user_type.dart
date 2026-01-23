// ignore_for_file: public_member_api_docs, sort_constructors_first

enum UserType {
  student('student'),
  faculty('faculty');

  final String label;
  const UserType(this.label);

  @override
  String toString() => label;

  /// Return the label used for JSON or user-facing strings.
  String toJson() => label;

  /// Parse from a label (throws if not found).
  static UserType fromLabel(String label) =>
      UserType.values.firstWhere((e) => e.label == label);

  /// Safe parse from label. Returns null if not found.
  static UserType? tryFromLabel(String? label) {
    if (label == null) return null;
    try {
      return UserType.values.firstWhere((e) => e.label == label);
    } catch (_) {
      return null;
    }
  }

  /// Parse from JSON value; falls back to [tableOnly] when unknown.
  static UserType fromJson(String? value) =>
      tryFromLabel(value) ?? UserType.student;
}
