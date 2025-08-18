class UserModel {
  final String id;
  final String name;
  final String email;
  final String role; // patient / doctor
  final String phone;
  final String imageUrl;
  final double rating;
  final String address;
  final String about;

  String get imagePath =>
      imageUrl.isNotEmpty ? imageUrl : 'assets/images/feture2.png';

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.phone = '',
    this.imageUrl = '',
    this.rating = 0.0,
    this.address = '',
    this.about = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? 'patient',
      phone: json['phone'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      address: json['address'] ?? '',
      about: json['about'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'phone': phone,
      'imageUrl': imageUrl,
      'rating': rating,
      'address': address,
      'about': about,
    };
  }
}
