// ignore_for_file: public_member_api_docs, sort_constructors_first

enum ItemSource {
  fromMenu('From Menu'),
  todaysSpecial('Today\'s Special');

  final String label;
  const ItemSource(this.label);

  @override
  String toString() => label;

  /// Return the label used for JSON or user-facing strings.
  String toJson() => label;

  /// Parse from a label (throws if not found).
  static ItemSource fromLabel(String label) =>
      ItemSource.values.firstWhere((e) => e.label == label);

  /// Safe parse from label. Returns null if not found.
  static ItemSource? tryFromLabel(String? label) {
    if (label == null) return null;
    try {
      return ItemSource.values.firstWhere((e) => e.label == label);
    } catch (_) {
      return null;
    }
  }

  /// Parse from JSON value; falls back to [tableOnly] when unknown.
  static ItemSource fromJson(String? value) =>
      tryFromLabel(value) ?? ItemSource.fromMenu;
}
