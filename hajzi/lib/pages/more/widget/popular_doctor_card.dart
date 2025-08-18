import 'package:flutter/material.dart';

class PopularDoctorCardmore extends StatelessWidget {
  final Map<String, dynamic> doctor;
  final int index;

  const PopularDoctorCardmore({
    super.key,
    required this.doctor,
    required this.index,
  });

  // دالة لإنشاء النجوم بناءً على التقييم
  List<Widget> buildRatingStars(double rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      if (i <= rating) {
        stars.add(const Icon(Icons.star, color: Colors.amber, size: 16));
      } else if (i - rating < 1) {
        stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 16));
      } else {
        stars.add(const Icon(Icons.star_border, color: Colors.amber, size: 16));
      }
    }
    return stars;
  }

  @override
  Widget build(BuildContext context) {
    final name = doctor["name"] ?? "No Name";
    final specialty = doctor["specialty"] ?? "No Specialty";
    final details = doctor["details"] ?? "No details available";
    final image = doctor["image"] ?? "assets/images/placeholder.png";
    final experience = doctor["experience"] ?? 0;
    final rating = doctor["rating"] ?? 0.0;

    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero),
      duration: Duration(milliseconds: 300 + index * 150),
      curve: Curves.easeOut,
      builder: (context, Offset offset, child) {
        return Transform.translate(
          offset: Offset(offset.dx * 200, 0),
          child: Opacity(opacity: 1.0 - offset.dx.abs(), child: child),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        height: 460,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.65), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              offset: Offset(1, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        specialty,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          ...buildRatingStars(rating.toDouble()),
                          const SizedBox(width: 8),
                          Text(
                            "$experience yrs experience",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Book Appointment"),
                          content: Text("Booking with $name"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Close"),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 6,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                    ),
                    child: const Text('Book', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                details,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
