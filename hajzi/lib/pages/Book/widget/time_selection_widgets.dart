import 'package:flutter/material.dart';
import 'package:hajzi/pages/Book/controls/time_selection_logic.dart';
import 'package:hajzi/pages/Book/widget/doctor_book_card.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black87),
          ),
          const Expanded(
            child: Text(
              "Select Time",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class TimeSelectionBody extends StatelessWidget {
  final TimeSelectionLogic logic;

  const TimeSelectionBody({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const DoctorBookCard(),
          const SizedBox(height: 30),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Please select a suitable time:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
          ),
          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () => logic.pickTime(context),
            icon: const Icon(Icons.access_time),
            label: const Text("Pick a Time"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 5,
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () => logic.confirmBooking(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 4,
            ),
            child: const Text("Confirm Booking"),
          ),

          const SizedBox(height: 30),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Container(
              key: ValueKey(logic.selectedTime),
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  logic.selectedTime != null
                      ? "Selected Time: ${logic.selectedTime!.format(context)}"
                      : "No time selected yet",
                  style: TextStyle(
                    fontSize: 18,
                    color: logic.selectedTime != null
                        ? Colors.black87
                        : Colors.grey,
                    fontWeight: logic.selectedTime != null
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          if (logic.bookingConfirmed) ...[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Doctor Location:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/location.png",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
