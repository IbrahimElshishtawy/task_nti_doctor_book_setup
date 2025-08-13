class DoctorModel {
  final String id;
  final String name;
  final String speciality;
  final double rating;
  final String imageUrl;
  final String? bio;

  DoctorModel({
    required this.id,
    required this.name,
    required this.speciality,
    required this.rating,
    required this.imageUrl,
    this.bio,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      speciality: json['speciality'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      bio: json['bio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'speciality': speciality,
      'rating': rating,
      'imageUrl': imageUrl,
      'bio': bio,
    };
  }
}
