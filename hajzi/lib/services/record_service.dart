import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/medical_record_model.dart';

class RecordService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Get all medical records for a specific patient
  Future<List<MedicalRecordModel>> getRecords(String patientId) async {
    try {
      QuerySnapshot snapshot = await _db
          .collection('medical_records')
          .where('patientId', isEqualTo: patientId)
          .get();

      return snapshot.docs.map((doc) {
        return MedicalRecordModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception("Failed to fetch records: $e");
    }
  }

  /// Get a single medical record by ID
  Future<MedicalRecordModel?> getRecordById(String id) async {
    try {
      DocumentSnapshot doc = await _db
          .collection('medical_records')
          .doc(id)
          .get();
      if (doc.exists) {
        return MedicalRecordModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception("Failed to fetch record: $e");
    }
  }

  /// Add new medical record
  Future<void> addRecord(MedicalRecordModel record) async {
    try {
      await _db
          .collection('medical_records')
          .doc(record.id)
          .set(record.toJson());
    } catch (e) {
      throw Exception("Failed to add record: $e");
    }
  }
}
