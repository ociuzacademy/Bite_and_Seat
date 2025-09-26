import 'package:bite_and_seat/core/models/food_item.dart';
import 'package:bite_and_seat/core/models/time_slot_model.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const List<TimeSlotModel> morningSlots = [
    TimeSlotModel(
      slotId: "01",
      startTime: TimeOfDay(hour: 8, minute: 30),
      endTime: TimeOfDay(hour: 8, minute: 59),
    ),
    TimeSlotModel(
      slotId: "02",
      startTime: TimeOfDay(hour: 9, minute: 0),
      endTime: TimeOfDay(hour: 9, minute: 29),
    ),
    TimeSlotModel(
      slotId: "03",
      startTime: TimeOfDay(hour: 9, minute: 30),
      endTime: TimeOfDay(hour: 9, minute: 59),
    ),
    TimeSlotModel(
      slotId: "04",
      startTime: TimeOfDay(hour: 10, minute: 0),
      endTime: TimeOfDay(hour: 10, minute: 29),
    ),
    TimeSlotModel(
      slotId: "05",
      startTime: TimeOfDay(hour: 10, minute: 30),
      endTime: TimeOfDay(hour: 10, minute: 59),
    ),
    TimeSlotModel(
      slotId: "06",
      startTime: TimeOfDay(hour: 11, minute: 0),
      endTime: TimeOfDay(hour: 11, minute: 29),
    ),
    TimeSlotModel(
      slotId: "07",
      startTime: TimeOfDay(hour: 11, minute: 30),
      endTime: TimeOfDay(hour: 11, minute: 59),
    ),
  ];
  static const List<TimeSlotModel> afternoonSlots = [
    TimeSlotModel(
      slotId: "08",
      startTime: TimeOfDay(hour: 12, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 29),
    ),
    TimeSlotModel(
      slotId: "09",
      startTime: TimeOfDay(hour: 12, minute: 30),
      endTime: TimeOfDay(hour: 12, minute: 59),
    ),
    TimeSlotModel(
      slotId: "10",
      startTime: TimeOfDay(hour: 13, minute: 0),
      endTime: TimeOfDay(hour: 13, minute: 29),
    ),
    TimeSlotModel(
      slotId: "11",
      startTime: TimeOfDay(hour: 13, minute: 30),
      endTime: TimeOfDay(hour: 13, minute: 59),
    ),
    TimeSlotModel(
      slotId: "12",
      startTime: TimeOfDay(hour: 14, minute: 0),
      endTime: TimeOfDay(hour: 14, minute: 29),
    ),
    TimeSlotModel(
      slotId: "13",
      startTime: TimeOfDay(hour: 14, minute: 30),
      endTime: TimeOfDay(hour: 14, minute: 59),
    ),
    TimeSlotModel(
      slotId: "14",
      startTime: TimeOfDay(hour: 15, minute: 0),
      endTime: TimeOfDay(hour: 15, minute: 29),
    ),
  ];
  static const List<TimeSlotModel> eveningSlots = [
    TimeSlotModel(
      slotId: "15",
      startTime: TimeOfDay(hour: 15, minute: 30),
      endTime: TimeOfDay(hour: 15, minute: 59),
    ),
    TimeSlotModel(
      slotId: "16",
      startTime: TimeOfDay(hour: 16, minute: 0),
      endTime: TimeOfDay(hour: 16, minute: 29),
    ),
    TimeSlotModel(
      slotId: "17",
      startTime: TimeOfDay(hour: 16, minute: 30),
      endTime: TimeOfDay(hour: 16, minute: 59),
    ),
    TimeSlotModel(
      slotId: "18",
      startTime: TimeOfDay(hour: 17, minute: 0),
      endTime: TimeOfDay(hour: 17, minute: 29),
    ),
    TimeSlotModel(
      slotId: "19",
      startTime: TimeOfDay(hour: 17, minute: 30),
      endTime: TimeOfDay(hour: 17, minute: 59),
    ),
    TimeSlotModel(
      slotId: "20",
      startTime: TimeOfDay(hour: 18, minute: 0),
      endTime: TimeOfDay(hour: 18, minute: 29),
    ),
  ];
  static const List<TimeSlotModel> nightSlots = [
    TimeSlotModel(
      slotId: "21",
      startTime: TimeOfDay(hour: 18, minute: 30),
      endTime: TimeOfDay(hour: 18, minute: 59),
    ),
    TimeSlotModel(
      slotId: "22",
      startTime: TimeOfDay(hour: 19, minute: 0),
      endTime: TimeOfDay(hour: 19, minute: 29),
    ),
    TimeSlotModel(
      slotId: "23",
      startTime: TimeOfDay(hour: 19, minute: 30),
      endTime: TimeOfDay(hour: 19, minute: 59),
    ),
    TimeSlotModel(
      slotId: "24",
      startTime: TimeOfDay(hour: 20, minute: 0),
      endTime: TimeOfDay(hour: 20, minute: 29),
    ),
    TimeSlotModel(
      slotId: "25",
      startTime: TimeOfDay(hour: 20, minute: 30),
      endTime: TimeOfDay(hour: 20, minute: 59),
    ),
    TimeSlotModel(
      slotId: "26",
      startTime: TimeOfDay(hour: 21, minute: 0),
      endTime: TimeOfDay(hour: 21, minute: 29),
    ),
  ];

  static const List<FoodItem> breakfastFoodItems = [
    FoodItem(
      foodItemId: "FD-BF-01",
      name: "Dosa",
      imageUrl: "https://images.unsplash.com/photo-1694849789325-914b71ab4075",
      rate: 30,
      itemsPerPlate: 2,
    ),
    FoodItem(
      foodItemId: "FD-BF-02",
      name: "Idli",
      imageUrl: "https://images.unsplash.com/photo-1632104667384-06f58cb7ad44",
      rate: 30,
      itemsPerPlate: 3,
    ),
    FoodItem(
      foodItemId: "FD-BF-03",
      name: "Uzhunnu Vada",
      imageUrl: "https://images.unsplash.com/photo-1730191843435-073792ba22bc",
      rate: 10,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-BF-04",
      name: "Parippu Vada",
      imageUrl: "https://images.unsplash.com/photo-1683533678059-63c6a0e9e3ef",
      rate: 10,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-BF-05",
      name: "Poori Masala",
      imageUrl: "https://images.unsplash.com/photo-1643892467625-65df6a500524",
      rate: 30,
      itemsPerPlate: 3,
    ),
    FoodItem(
      foodItemId: "FD-BF-06",
      name: "Upma",
      imageUrl:
          "https://cdn.pixabay.com/photo/2014/05/17/19/02/upma-346484_960_720.jpg",
      rate: 25,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-BF-07",
      name: "Tea",
      imageUrl:
          "https://images.pexels.com/photos/33210272/pexels-photo-33210272.jpeg",
      rate: 12,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-BF-08",
      name: "Coffee",
      imageUrl:
          "https://images.pexels.com/photos/2697931/pexels-photo-2697931.jpeg",
      rate: 12,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-BF-09",
      name: "Black Tea",
      imageUrl:
          "https://images.pexels.com/photos/1493080/pexels-photo-1493080.jpeg",
      rate: 10,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-BF-10",
      name: "Black Coffee",
      imageUrl:
          "https://images.pexels.com/photos/733763/pexels-photo-733763.jpeg",
      rate: 10,
      itemsPerPlate: 1,
    ),
  ];
  static const List<FoodItem> lunchFoodItems = [
    FoodItem(
      foodItemId: "FD-LU-01",
      name: "Meals",
      imageUrl: "https://images.unsplash.com/photo-1625398407796-82650a8c135f",
      rate: 60,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-LU-02",
      name: "Chicken Biryani",
      imageUrl: "https://images.unsplash.com/photo-1701579231305-d84d8af9a3fd",
      rate: 120,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-LU-03",
      name: "Half Chicken Biryani",
      imageUrl: "https://images.unsplash.com/photo-1701579231305-d84d8af9a3fd",
      rate: 60,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-LU-04",
      name: "Veg Biryani",
      imageUrl: "https://images.unsplash.com/photo-1630409346824-4f0e7b080087",
      rate: 50,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-LU-05",
      name: "Beef Biryani",
      imageUrl:
          "https://cdn.pixabay.com/photo/2021/01/10/04/38/rice-5904095_1280.jpg",
      rate: 120,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-LU-06",
      name: "Half Beef Biryani",
      imageUrl:
          "https://cdn.pixabay.com/photo/2021/01/10/04/38/rice-5904095_1280.jpg",
      rate: 60,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-LU-07",
      name: "Chicken Curry",
      imageUrl: "https://images.unsplash.com/photo-1708782344490-9026aaa5eec7",
      rate: 80,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-LU-08",
      name: "Beef Curry",
      imageUrl: "https://images.unsplash.com/photo-1545247181-516773cae754",
      rate: 80,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-LU-09",
      name: "Single Omlette",
      imageUrl: "https://images.unsplash.com/photo-1646579933415-92109f9805df",
      rate: 20,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-LU-10",
      name: "Double Omlette",
      imageUrl: "https://images.unsplash.com/photo-1646579933415-92109f9805df",
      rate: 40,
      itemsPerPlate: 1,
    ),
  ];
  static const List<FoodItem> eveningSnackFoodItems = [
    FoodItem(
      foodItemId: "FD-EV-01",
      name: "Uzhunnu Vada",
      imageUrl: "https://images.unsplash.com/photo-1730191843435-073792ba22bc",
      rate: 10,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-EV-02",
      name: "Parippu Vada",
      imageUrl: "https://images.unsplash.com/photo-1683533678059-63c6a0e9e3ef",
      rate: 10,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-EV-03",
      name: "Pazhampori",
      imageUrl:
          "https://www-vegrecipesofindia-com.translate.goog/wp-content/uploads/2016/12/pazham-pori-recipe.jpg",
      rate: 10,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-EV-04",
      name: "Mulaku Bajji",
      imageUrl:
          "https://www.shutterstock.com/shutterstock/photos/767917333/display_1500/stock-photo-mulaku-bajji-or-chili-bajii-popular-spicy-evening-tea-time-snack-prepared-use-banana-pepper-with-767917333.jpg",
      rate: 10,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-EV-05",
      name: "Tea",
      imageUrl:
          "https://images.pexels.com/photos/33210272/pexels-photo-33210272.jpeg",
      rate: 12,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-EV-06",
      name: "Coffee",
      imageUrl:
          "https://images.pexels.com/photos/2697931/pexels-photo-2697931.jpeg",
      rate: 12,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-EV-07",
      name: "Black Tea",
      imageUrl:
          "https://images.pexels.com/photos/1493080/pexels-photo-1493080.jpeg",
      rate: 10,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-EV-08",
      name: "Black Coffee",
      imageUrl:
          "https://images.pexels.com/photos/733763/pexels-photo-733763.jpeg",
      rate: 10,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-EV-09",
      name: "Kaaya Bajji",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/A_closeup_of_Bajji.JPG/800px-A_closeup_of_Bajji.JPG",
      rate: 10,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-EV-10",
      name: "Bonda",
      imageUrl:
          "https://www.shutterstock.com/shutterstock/photos/1981071683/display_1500/stock-photo-top-view-of-south-indian-bonda-1981071683.jpg",
      rate: 10,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-EV-11",
      name: "Mutta Bajji",
      imageUrl:
          "https://www.shutterstock.com/shutterstock/photos/1077264602/display_1500/stock-photo-tasty-egg-pakora-or-pakoda-served-with-tomato-ketchup-1077264602.jpg",
      rate: 15,
      itemsPerPlate: 1,
    ),
  ];
  static const List<FoodItem> dinnerFoodItems = [
    FoodItem(
      foodItemId: "FD-DI-01",
      name: "Meals",
      imageUrl: "https://images.unsplash.com/photo-1625398407796-82650a8c135f",
      rate: 60,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-DI-02",
      name: "Chicken Biryani",
      imageUrl: "https://images.unsplash.com/photo-1701579231305-d84d8af9a3fd",
      rate: 120,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-DI-03",
      name: "Half Chicken Biryani",
      imageUrl: "https://images.unsplash.com/photo-1701579231305-d84d8af9a3fd",
      rate: 60,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-DI-04",
      name: "Veg Biryani",
      imageUrl: "https://images.unsplash.com/photo-1630409346824-4f0e7b080087",
      rate: 50,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-DI-05",
      name: "Beef Biryani",
      imageUrl:
          "https://cdn.pixabay.com/photo/2021/01/10/04/38/rice-5904095_1280.jpg",
      rate: 120,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-DI-06",
      name: "Half Beef Biryani",
      imageUrl:
          "https://cdn.pixabay.com/photo/2021/01/10/04/38/rice-5904095_1280.jpg",
      rate: 60,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-DI-07",
      name: "Chicken Curry",
      imageUrl: "https://images.unsplash.com/photo-1708782344490-9026aaa5eec7",
      rate: 80,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-DI-08",
      name: "Beef Curry",
      imageUrl: "https://images.unsplash.com/photo-1545247181-516773cae754",
      rate: 80,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-DI-09",
      name: "Single Omlette",
      imageUrl: "https://images.unsplash.com/photo-1646579933415-92109f9805df",
      rate: 20,
      itemsPerPlate: 1,
    ),
    FoodItem(
      foodItemId: "FD-DI-10",
      name: "Double Omlette",
      imageUrl: "https://images.unsplash.com/photo-1646579933415-92109f9805df",
      rate: 40,
      itemsPerPlate: 1,
    ),
  ];
}
