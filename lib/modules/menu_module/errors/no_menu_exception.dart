// Custom exception for when no menu is set for a given date
class NoMenuException implements Exception {
  final String message;
  final DateTime date;

  NoMenuException(
    this.date, {
    this.message = 'No menu available for the selected date',
  });

  @override
  String toString() => 'NoMenuException: $message (Date: $date)';
}
