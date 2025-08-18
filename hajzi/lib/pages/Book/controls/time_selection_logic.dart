import 'package:flutter/material.dart';

class TimeSelectionLogic extends ChangeNotifier {
  TimeOfDay? selectedTime;
  bool bookingConfirmed = false;

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      selectedTime = time;
      bookingConfirmed = false;
      notifyListeners();
    }
  }

  void confirmBooking(BuildContext context) {
    if (selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a time before confirming."),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    bookingConfirmed = true;
    notifyListeners();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 16),
            const Text(
              "Booking Confirmed!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Your appointment at ${selectedTime!.format(context)} is booked successfully.",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text("OK"),
            ),
          ),
        ],
      ),
    );
  }
}
