class DiagnosisModel {
  final String id;
  final String patientId;
  final String doctorId;
  final String diagnosis;
  final String date;

  DiagnosisModel({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.diagnosis,
    required this.date,
  });

  factory DiagnosisModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisModel(
      id: json['id'] ?? '',
      patientId: json['patientId'] ?? '',
      doctorId: json['doctorId'] ?? '',
      diagnosis: json['diagnosis'] ?? '',
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'doctorId': doctorId,
      'diagnosis': diagnosis,
      'date': date,
    };
  }
}
