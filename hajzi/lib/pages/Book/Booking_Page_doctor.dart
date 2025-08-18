// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hajzi/pages/Book/controls/booking_controller.dart';
import 'package:hajzi/pages/Book/widget/day_selector_widget.dart';
import 'package:hajzi/pages/Book/widget/doctor_book_card.dart';
import 'package:hajzi/pages/Book/widget/booking_buttons.dart';

class BookingPage extends StatelessWidget {
  final String imageUrl;
  final String nameDoctor;
  final String specialty;

  const BookingPage({
    super.key,
    required this.imageUrl,
    required this.nameDoctor,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookingController(),
      child: _BookingView(
        imageUrl: imageUrl,
        nameDoctor: nameDoctor,
        specialty: specialty,
      ),
    );
  }
}

class _BookingView extends StatelessWidget {
  final String imageUrl;
  final String nameDoctor;
  final String specialty;

  const _BookingView({
    required this.imageUrl,
    required this.nameDoctor,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BookingController>();

    if (controller.daysList.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        shadowColor: Colors.grey.withOpacity(0.2),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Select Time",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorBookCard(
              name: nameDoctor,
              specialty: specialty,
              image: imageUrl,
            ),

            const SizedBox(height: 24),
            DaySelectorWidget(
              daysList: controller.daysList,
              selectedIndex: controller.selectedDayIndex,
              onDaySelected: controller.selectDay,
            ),
            const SizedBox(height: 32),
            const Text(
              "Next availability",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            NextAvailabilityButton(controller: controller),
            const SizedBox(height: 20),
            const OrDivider(),
            const SizedBox(height: 20),
            const ContactClinicButton(),
          ],
        ),
      ),
    );
  }
}
