import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification_model.dart';

class NotificationService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> sendNotification(NotificationModel notification) async {
    await _db
        .collection('notifications')
        .doc(notification.id)
        .set(notification.toJson());
  }

  Future<List<NotificationModel>> getNotificationsByUser(String userId) async {
    QuerySnapshot snapshot = await _db
        .collection('notifications')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs
        .map(
          (doc) =>
              NotificationModel.fromJson(doc.data() as Map<String, dynamic>),
        )
        .toList();
  }

  Future<void> markAsRead(String id) async {
    await _db.collection('notifications').doc(id).update({'isRead': true});
  }
}
