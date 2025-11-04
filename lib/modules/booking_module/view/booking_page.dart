// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/booking_module/providers/booking_state_provider.dart';
import 'package:bite_and_seat/modules/booking_module/utils/booking_helper.dart';
import 'package:bite_and_seat/modules/booking_module/widgets/number_of_persons_widget.dart';
import 'package:bite_and_seat/modules/booking_module/widgets/time_slot_selection_widget.dart';

class BookingPage extends StatefulWidget {
  final List<CartItemModel> cartItems;
  final FoodTime foodTime;
  final DateTime selectedDate;
  const BookingPage({
    super.key,
    required this.cartItems,
    required this.foodTime,
    required this.selectedDate,
  });

  @override
  State<BookingPage> createState() => _BookingPageState();

  static route({
    required List<CartItemModel> cartItems,
    required FoodTime foodTime,
    required DateTime selectedDate,
  }) => MaterialPageRoute(
    builder: (context) => ChangeNotifierProvider(
      create: (context) => BookingStateProvider(),
      child: BookingPage(
        cartItems: cartItems,
        foodTime: foodTime,
        selectedDate: selectedDate,
      ),
    ),
  );
}

class _BookingPageState extends State<BookingPage> {
  late final BookingHelper _bookingHelper;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bookingStateProvider = Provider.of<BookingStateProvider>(
        context,
        listen: false,
      );
      _bookingHelper = BookingHelper(
        context: context,
        cartItems: widget.cartItems,
        bookingStateProvider: bookingStateProvider,
        selectedDate: widget.selectedDate,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        titleTextStyle: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(color: AppPalette.whiteColor),
        backgroundColor: AppPalette.firstColor,
      ),
      body: Consumer<BookingStateProvider>(
        builder: (context, bookingStateProvider, child) {
          return Column(
            children: [
              if (widget.cartItems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppPalette.firstColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${widget.cartItems.length} items in the cart.',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () =>
                              _bookingHelper.openCart(widget.cartItems),
                          child: Text(
                            'CART',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
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
                child: Stepper(
                  currentStep: bookingStateProvider.currentStep,
                  onStepCancel: () {
                    if (bookingStateProvider.currentStep > 0) {
                      bookingStateProvider.setCurrentStep(
                        bookingStateProvider.currentStep - 1,
                      );
                    }
                  },
                  onStepContinue: () {
                    if (bookingStateProvider.currentStep < 1) {
                      bookingStateProvider.setCurrentStep(
                        bookingStateProvider.currentStep + 1,
                      );
                    } else {
                      // Submit booking
                      _bookingHelper.submitBooking();
                    }
                  },
                  onStepTapped: (int index) {
                    bookingStateProvider.setCurrentStep(index);
                  },
                  steps: <Step>[
                    Step(
                      title: const Text('Select Time Slot'),
                      content: TimeSlotSelectionWidget(
                        timeSlots: _bookingHelper.getTimeSlots(widget.foodTime),
                        selectedTimeSlot: bookingStateProvider.selectedTimeSlot,
                        onSelectingTimeSlot: (slot) {
                          bookingStateProvider.setSelectedTimeSlot(slot);
                        },
                        formatTimeOfDay: _bookingHelper.formatTimeOfDay,
                      ),
                      isActive: bookingStateProvider.currentStep >= 1,
                      state: bookingStateProvider.currentStep >= 1
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: const Text('Number of People'),
                      content: NumberOfPersonsWidget(
                        numberOfPersons: bookingStateProvider.numberOfPersons,
                        onRemovingNumberOfPersons: () {
                          if (bookingStateProvider.numberOfPersons > 1) {
                            bookingStateProvider.setNumberOfPersons(
                              bookingStateProvider.numberOfPersons - 1,
                            );
                          }
                        },
                        onAddingNumberOfPersons: () {
                          if (bookingStateProvider.numberOfPersons < 10) {
                            // Limit to 10 persons
                            bookingStateProvider.setNumberOfPersons(
                              bookingStateProvider.numberOfPersons + 1,
                            );
                          }
                        },
                      ),
                      isActive: bookingStateProvider.currentStep >= 2,
                      state: bookingStateProvider.currentStep >= 2
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
                              if (bookingStateProvider.currentStep != 0)
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
                                  bookingStateProvider.currentStep == 2
                                      ? 'Book Now'
                                      : 'Next',
                                  style: TextStyle(
                                    color: AppPalette.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
