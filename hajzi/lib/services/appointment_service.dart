import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/appointment_model.dart';

class AppointmentService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> bookAppointment(AppointmentModel appointment) async {
    await _db
        .collection('appointments')
        .doc(appointment.id)
        .set(appointment.toJson());
  }

  Future<List<AppointmentModel>> getAppointmentsByUser(String userId) async {
    QuerySnapshot snapshot = await _db
        .collection('appointments')
        .where('patientId', isEqualTo: userId)
        .get();

    return snapshot.docs
        .map(
          (doc) =>
              AppointmentModel.fromJson(doc.data() as Map<String, dynamic>),
        )
        .toList();
  }

  Future<void> updateAppointmentStatus(String id, String status) async {
    await _db.collection('appointments').doc(id).update({'status': status});
  }
}
