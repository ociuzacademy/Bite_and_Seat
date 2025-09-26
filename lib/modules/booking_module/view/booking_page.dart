// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/models/time_slot_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/booking_module/utils/booking_helper.dart';
import 'package:bite_and_seat/modules/booking_module/widgets/date_selection_widget.dart';
import 'package:bite_and_seat/modules/booking_module/widgets/number_of_persons_widget.dart';
import 'package:bite_and_seat/modules/booking_module/widgets/time_slot_selection_widget.dart';

class BookingPage extends StatefulWidget {
  final List<CartItemModel> cartItems;
  final FoodTime foodTime;
  const BookingPage({
    super.key,
    required this.cartItems,
    required this.foodTime,
  });

  @override
  State<BookingPage> createState() => _BookingPageState();

  static route({
    required List<CartItemModel> cartItems,
    required FoodTime foodTime,
  }) => MaterialPageRoute(
    builder: (context) => BookingPage(cartItems: cartItems, foodTime: foodTime),
  );
}

class _BookingPageState extends State<BookingPage> {
  late final BookingHelper _bookingHelper;

  // Converted state to ValueNotifiers
  final ValueNotifier<int> _currentStep = ValueNotifier<int>(0);
  final ValueNotifier<DateTime> _selectedDate = ValueNotifier<DateTime>(
    DateTime.now(),
  );
  final ValueNotifier<TimeSlotModel?> _selectedTimeSlot =
      ValueNotifier<TimeSlotModel?>(null);
  final ValueNotifier<int> _numberOfPersons = ValueNotifier<int>(1);

  @override
  void initState() {
    _bookingHelper = BookingHelper(
      context: context,
      cartItems: widget.cartItems,
      currentStep: _currentStep,
      selectedDate: _selectedDate,
      selectedTimeSlot: _selectedTimeSlot,
      numberOfPersons: _numberOfPersons,
    );

    super.initState();
  }

  @override
  void dispose() {
    _currentStep.dispose();
    _selectedDate.dispose();
    _selectedTimeSlot.dispose();
    _numberOfPersons.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Generate dates for the next 7 days
    final List<DateTime> dateOptions = List.generate(7, (index) {
      return DateTime.now().add(Duration(days: index));
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        titleTextStyle: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(color: AppPalette.whiteColor),
        backgroundColor: AppPalette.firstColor,
      ),
      body: Column(
        children: [
          if (widget.cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: AppPalette.firstColor, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      '${widget.cartItems.length} items in the cart.',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          _bookingHelper.openCart(widget.cartItems),
                      child: Text(
                        'CART',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppPalette.firstColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Container(
            padding: const EdgeInsets.all(16),
            child: ValueListenableBuilder<int>(
              valueListenable: _currentStep,
              builder: (context, currentStep, _) {
                return Stepper(
                  currentStep: currentStep,
                  onStepCancel: () {
                    if (currentStep > 0) {
                      _currentStep.value = currentStep - 1;
                    }
                  },
                  onStepContinue: () {
                    if (currentStep < 2) {
                      _currentStep.value = currentStep + 1;
                    } else {
                      // Submit booking
                      _bookingHelper.submitBooking();
                    }
                  },
                  onStepTapped: (int index) {
                    _currentStep.value = index;
                  },
                  steps: <Step>[
                    Step(
                      title: const Text('Select Date'),
                      content: ValueListenableBuilder<DateTime>(
                        valueListenable: _selectedDate,
                        builder: (context, selectedDate, __) =>
                            DateSelectionWidget(
                              dateOptions: dateOptions,
                              selectedDate: selectedDate,
                              isSameDay: _bookingHelper.isSameDay,
                              onSelectingDate: (date) {
                                _selectedDate.value = date;
                              },
                              getDayName: _bookingHelper.getDayName,
                              getMonthName: _bookingHelper.getMonthName,
                            ),
                      ),
                      isActive: currentStep >= 0,
                      state: currentStep >= 0
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: const Text('Select Time Slot'),
                      content: ValueListenableBuilder<TimeSlotModel?>(
                        valueListenable: _selectedTimeSlot,
                        builder: (context, selectedTimeSlot, _) {
                          return TimeSlotSelectionWidget(
                            timeSlots: _bookingHelper.getTimeSlots(
                              widget.foodTime,
                            ),
                            selectedTimeSlot:
                                selectedTimeSlot, // Pass the selected time slot
                            onSelectingTimeSlot: (slot) {
                              _selectedTimeSlot.value = slot;
                            },
                            formatTimeOfDay: _bookingHelper.formatTimeOfDay,
                          );
                        },
                      ),
                      isActive: currentStep >= 1,
                      state: currentStep >= 1
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: const Text('Number of People'),
                      content: ValueListenableBuilder<int>(
                        valueListenable: _numberOfPersons,
                        builder: (context, numPersons, __) =>
                            NumberOfPersonsWidget(
                              numberOfPersons: numPersons,
                              onRemovingNumberOfPersons: () {
                                if (numPersons > 1) {
                                  _numberOfPersons.value = numPersons - 1;
                                }
                              },
                              onAddingNumberOfPersons: () {
                                if (numPersons < 10) {
                                  // Limit to 10 persons
                                  _numberOfPersons.value = numPersons + 1;
                                }
                              },
                            ),
                      ),
                      isActive: currentStep >= 2,
                      state: currentStep >= 2
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                  ],
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Row(
                            children: <Widget>[
                              if (currentStep != 0)
                                ElevatedButton(
                                  onPressed: details.onStepCancel,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppPalette.whiteColor,
                                  ),
                                  child: const Text(
                                    'Back',
                                    style: TextStyle(
                                      color: AppPalette.firstColor,
                                    ),
                                  ),
                                ),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                onPressed: details.onStepContinue,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppPalette.firstColor,
                                ),
                                child: Text(
                                  currentStep == 2 ? 'Book Now' : 'Next',
                                  style: TextStyle(
                                    color: AppPalette.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
