class MedicalRecordModel {
  final String id;
  final String patientId;
  final String title;
  final String description;
  final String date;

  MedicalRecordModel({
    required this.id,
    required this.patientId,
    required this.title,
    required this.description,
    required this.date,
  });

  factory MedicalRecordModel.fromJson(Map<String, dynamic> json) {
    return MedicalRecordModel(
      id: json['id'] ?? '',
      patientId: json['patientId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'title': title,
      'description': description,
      'date': date,
    };
  }
}
