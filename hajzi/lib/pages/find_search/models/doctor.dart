class DoctorModel {
  final String id;
  final String name;
  final String speciality;
  final String imageUrl;
  final String nextAvailable;
  final double rating;
  final int patients;

  DoctorModel({
    required this.id,
    required this.name,
    required this.speciality,
    required this.imageUrl,
    required this.nextAvailable,
    required this.rating,
    required this.patients,
  });

  // من Map → Object
  factory DoctorModel.fromMap(Map<String, dynamic> data, String documentId) {
    return DoctorModel(
      id: documentId,
      name: data['name'] ?? '',
      speciality: data['speciality'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      nextAvailable: data['nextAvailable'] ?? 'Not Available',
      rating: (data['rating'] ?? 0).toDouble(),
      patients: data['patients'] ?? 0,
    );
  }

  // من Object → Map (للحفظ في Firestore)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'speciality': speciality,
      'imageUrl': imageUrl,
      'nextAvailable': nextAvailable,
      'rating': rating,
      'patients': patients,
    };
  }
}
