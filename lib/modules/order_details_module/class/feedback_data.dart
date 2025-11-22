// ignore_for_file: public_member_api_docs, sort_constructors_first
class FeedbackData {
  final int orderId;
  final int overallRating;
  final String comments;
  final List<ItemRating> itemRatings;
  const FeedbackData({
    required this.orderId,
    required this.overallRating,
    required this.comments,
    required this.itemRatings,
  });
}

class ItemRating {
  final int foodItem;
  final int rating;
  const ItemRating({required this.foodItem, required this.rating});
}
