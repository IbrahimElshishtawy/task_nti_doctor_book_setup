import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/doctor_model.dart';

class DoctorService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<DoctorModel>> getDoctors() async {
    try {
      QuerySnapshot snapshot = await _db.collection('doctors').get();

      return snapshot.docs.map((doc) {
        return DoctorModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception("Failed to fetch doctors: $e");
    }
  }

  Future<DoctorModel?> getDoctorById(String id) async {
    try {
      DocumentSnapshot doc = await _db.collection('doctors').doc(id).get();
      if (doc.exists) {
        return DoctorModel.fromJson(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception("Failed to fetch doctor: $e");
    }
  }

  Future<void> addDoctor(DoctorModel doctor) async {
    try {
      await _db.collection('doctors').doc(doctor.id).set(doctor.toJson());
    } catch (e) {
      throw Exception("Failed to add doctor: $e");
    }
  }
}
