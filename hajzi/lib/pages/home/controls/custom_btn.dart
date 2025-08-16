import 'package:flutter/material.dart';

class buttom extends StatelessWidget {
  const buttom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // ارتفاع العنصر للحفاظ على المساحة
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: [
          // أول عنصر: صندوق أزرق مع أيقونة أسنان
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.medical_services,
              color: Colors.white,
              size: 50,
            ),
          ),

          // ثاني عنصر: صندوق أخضر مع أيقونة قلب
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.favorite, color: Colors.white, size: 50),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const HeartPage()),
                // );
              },
            ),
          ),

          // ثالث عنصر: صندوق أصفر مع أيقونة عين
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.yellow.shade700,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.remove_red_eye,
                color: Colors.white,
                size: 50,
              ),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const EyePage()),
                // );
              },
            ),
          ),

          // رابع عنصر: صندوق برتقالي مع أيقونة بادي (Play)
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.play_arrow, color: Colors.white, size: 50),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const StartPage()),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
