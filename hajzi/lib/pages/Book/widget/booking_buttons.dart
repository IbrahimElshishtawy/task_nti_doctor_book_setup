// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hajzi/pages/Book/controls/booking_controller.dart';
import 'package:hajzi/pages/Book/Time_Selection_Page.dart';

class NextAvailabilityButton extends StatelessWidget {
  final BookingController controller;
  const NextAvailabilityButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0BFF40), Color(0xFF33A15E)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () async {
          final selectedTime = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TimeSelectionPage()),
          );

          if (selectedTime != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green[600],
                content: Text(
                  "اليوم: ${controller.formattedSelectedDate}\nالوقت: $selectedTime",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }
        },
        child: Text(
          "Next availability on ${controller.formattedSelectedDate}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Text(
            "or",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}

class ContactClinicButton extends StatelessWidget {
  const ContactClinicButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.phone, color: Color.fromARGB(255, 58, 183, 93)),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Color.fromARGB(255, 49, 243, 127),
          width: 1.5,
        ),
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: () {},
      label: const Text(
        "Contact Clinic",
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 58, 183, 116),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
