import 'package:flutter/material.dart';

class DoctorBookCard extends StatefulWidget {
  final String name;
  final String specialty;
  final String image;

  const DoctorBookCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.image,
  });

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
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 36, backgroundImage: AssetImage(widget.image)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.specialty,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
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
