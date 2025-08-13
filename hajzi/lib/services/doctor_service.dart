import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/doctor_model.dart';

class DoctorService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<DoctorModel>> getAllDoctors() async {
    QuerySnapshot snapshot = await _db.collection('doctors').get();
    return snapshot.docs
        .map((doc) => DoctorModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<DoctorModel?> getDoctorById(String id) async {
    DocumentSnapshot doc = await _db.collection('doctors').doc(id).get();
    if (doc.exists) {
      return DoctorModel.fromJson(doc.data() as Map<String, dynamic>);
    }
    return null;
  }
}
