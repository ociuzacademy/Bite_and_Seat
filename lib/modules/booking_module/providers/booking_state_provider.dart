import 'package:flutter/material.dart';

import 'package:bite_and_seat/modules/booking_module/models/category_time_slot_model.dart';

class BookingStateProvider with ChangeNotifier {
  int _currentStep = 0;
  CategoryTimeSlotModel? _selectedTimeSlot;
  int _numberOfPersons = 1;

  // Getters
  int get currentStep => _currentStep;
  CategoryTimeSlotModel? get selectedTimeSlot => _selectedTimeSlot;
  int get numberOfPersons => _numberOfPersons;

  // Setters
  void setCurrentStep(int step) {
    _currentStep = step;
    notifyListeners();
  }

  void setSelectedTimeSlot(CategoryTimeSlotModel? timeSlot) {
    _selectedTimeSlot = timeSlot;
    notifyListeners();
  }

  void setNumberOfPersons(int persons) {
    _numberOfPersons = persons;
    notifyListeners();
  }

  // Reset method
  void reset() {
    _currentStep = 0;
    _selectedTimeSlot = null;
    _numberOfPersons = 1;
    notifyListeners();
  }
}
