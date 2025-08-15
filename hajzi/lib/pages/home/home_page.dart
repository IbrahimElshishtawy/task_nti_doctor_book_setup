import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== App Bar =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage("assets/images/feture2.png"),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none, size: 28),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ===== Title =====
              const Text(
                "Find Your Doctor",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "Get the best medical services",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // ===== Search Bar =====
              TextField(
                decoration: InputDecoration(
                  hintText: "Search doctor or health issue",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // ===== 4 Categories =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategory(Icons.local_hospital, "Hospital", Colors.blue),
                  _buildCategory(Icons.people, "Doctor", Colors.purple),
                  _buildCategory(
                    Icons.medical_services,
                    "Medicine",
                    Colors.orange,
                  ),
                  _buildCategory(Icons.emergency, "Ambulance", Colors.red),
                ],
              ),
              const SizedBox(height: 30),

              // ===== Live Doctors =====
              _buildSectionTitle("Live Doctors"),
              const SizedBox(height: 15),
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildLiveDoctor(
                      "assets/images/imageLive1.png",
                      "Dr. Sarah",
                    ),
                    _buildLiveDoctor(
                      "assets/images/imageLive2.png",
                      "Dr. John",
                    ),
                    _buildLiveDoctor(
                      "assets/images/imageLive3.png",
                      "Dr. Emily",
                    ),
                    _buildLiveDoctor(
                      "assets/images/imageLive2.png",
                      "Dr. Adam",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // ===== Popular Doctors =====
              _buildSectionTitle("Popular Doctors"),
              const SizedBox(height: 15),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildDoctorCard(
                      "assets/images/feture4.png",
                      "Dr. Sarah",
                      "Cardiologist",
                    ),
                    _buildDoctorCard(
                      "assets/images/feture2.png",
                      "Dr. John",
                      "Dermatologist",
                    ),
                    _buildDoctorCard(
                      "assets/images/feture3.png",
                      "Dr. Emily",
                      "Pediatrician",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // ===== Featured Doctor =====
              _buildSectionTitle("Featured Doctor"),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(
                        "assets/images/imagepopular1.png",
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Dr. Adam Smith",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Orthopedic Specialist",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "15 years experience in orthopedic treatments.",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // ===== Bottom Navigation Bar =====
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // TODO: Navigation logic
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Appointments",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  // ===== Helper Widgets =====
  Widget _buildCategory(IconData icon, String title, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, size: 28, color: color),
        ),
        const SizedBox(height: 6),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildLiveDoctor(String image, String name) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(radius: 35, backgroundImage: AssetImage(image)),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 14,
                  width: 14,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(String image, String name, String specialty) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(radius: 35, backgroundImage: AssetImage(image)),
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(
            specialty,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
