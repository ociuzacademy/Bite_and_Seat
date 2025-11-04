// ignore_for_file: public_member_api_docs, sort_constructors_first
class FoodItem {
  final int foodItemId;
  final String name;
  final String imageUrl;
  final double rate;
  final int itemsPerPlate;
  const FoodItem({
    required this.foodItemId,
    required this.name,
    required this.imageUrl,
    required this.rate,
    required this.itemsPerPlate,
  });
}
