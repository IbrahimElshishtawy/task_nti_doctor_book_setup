// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hajzi/pages/Book/Time_Selection_Page.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Select Time",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // كارت بيانات الدكتور
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage("assets/images/feture4.png"),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Dr. Shruti Kedia",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Pediatrician, MBBS, MD",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.favorite, color: Colors.red, size: 28),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tabs للتاريخ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoiceChip(
                  label: const Text("Today, 23 Feb"),
                  selected: false,
                  selectedColor: Colors.deepPurple,
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: Colors.grey[200],
                  onSelected: (_) {},
                ),
                ChoiceChip(
                  label: const Text("Tomorrow, 24 Feb"),
                  selected: true,
                  selectedColor: Colors.deepPurple,
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: Colors.grey[200],
                  onSelected: (_) {},
                ),
              ],
            ),
            const SizedBox(height: 32),

            // وقت متاح
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Next availability",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // زرار Gradient للحجز --> يفتح صفحة اختيار الوقت
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 11, 255, 64),
                    Color.fromARGB(209, 51, 161, 94),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  final selectedTime = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TimeSelectionPage(),
                    ),
                  );

                  if (selectedTime != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("الوقت المختار: $selectedTime")),
                    );
                  }
                },
                child: const Text(
                  "Next availability on Wed, 24 Feb",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // زرار Contact Clinic
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.deepPurple, width: 1.5),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Contact Clinic",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
