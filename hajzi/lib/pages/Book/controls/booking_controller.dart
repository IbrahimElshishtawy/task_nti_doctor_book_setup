import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingController extends ChangeNotifier {
  int selectedDayIndex = 0;
  final int daysToShow = 7;
  List<DateTime> daysList = [];

  BookingController() {
    _generateDays();
  }

  void _generateDays() {
    final today = DateTime.now();
    daysList = List.generate(
      daysToShow,
      (index) => today.add(Duration(days: index)),
    );
    notifyListeners();
  }

  void selectDay(int index) {
    selectedDayIndex = index;
    notifyListeners();
  }

  DateTime get selectedDate => daysList[selectedDayIndex];

  String get formattedSelectedDate =>
      DateFormat("EEE, d MMM").format(selectedDate);
}
