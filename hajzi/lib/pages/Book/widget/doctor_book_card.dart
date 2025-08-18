import 'package:flutter/material.dart';

class DoctorBookCard extends StatefulWidget {
  const DoctorBookCard({super.key});

  @override
  State<DoctorBookCard> createState() => _DoctorBookCardState();
}

class _DoctorBookCardState extends State<DoctorBookCard> {
  bool isFavorite = false; // القلب فاضي افتراضياً

  @override
  Widget build(BuildContext context) {
    return Container(
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
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
