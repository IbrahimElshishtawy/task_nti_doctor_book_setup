// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaySelectorWidget extends StatelessWidget {
  final List<DateTime> daysList;
  final int selectedIndex;
  final Function(int) onDaySelected;

  const DaySelectorWidget({
    super.key,
    required this.daysList,
    required this.selectedIndex,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // ارتفاع كافي للشيبس
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: daysList.length,
        itemBuilder: (context, index) {
          final day = daysList[index];
          final isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () => onDaySelected(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: isSelected
                      ? const LinearGradient(
                          colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isSelected ? null : Colors.grey[200],
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      DateFormat("EEE").format(day), // اختصار اليوم
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat("d MMM").format(day), // التاريخ
                      style: TextStyle(
                        fontSize: 14,
                        color: isSelected ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
