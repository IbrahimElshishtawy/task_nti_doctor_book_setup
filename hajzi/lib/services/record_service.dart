import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/medical_record_model.dart';

class RecordService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addRecord(MedicalRecordModel record) async {
    await _db.collection('medical_records').doc(record.id).set(record.toJson());
  }

  Future<List<MedicalRecordModel>> getRecordsByPatient(String patientId) async {
    QuerySnapshot snapshot = await _db
        .collection('medical_records')
        .where('patientId', isEqualTo: patientId)
        .get();

    return snapshot.docs
        .map(
          (doc) =>
              MedicalRecordModel.fromJson(doc.data() as Map<String, dynamic>),
        )
        .toList();
  }
}
