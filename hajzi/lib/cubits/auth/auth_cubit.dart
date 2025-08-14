import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthCubit(this._auth, this._firestore) : super(AuthInitial());

  /// تسجيل مستخدم جديد
  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    try {
      final userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCred.user!.uid).set({
        'uid': userCred.user!.uid, // تخزين UID
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Registration failed'));
    }
  }

  /// تسجيل الدخول
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Login failed'));
    }
  }

  /// تسجيل الخروج
  Future<void> logout() async {
    try {
      await _auth.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure('Logout failed'));
    }
  }

  /// التحقق من حالة المستخدم عند فتح التطبيق
  void checkAuthStatus() {
    if (_auth.currentUser != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthInitial());
    }
  }

  /// جلب بيانات المستخدم الحالي
  Future<Map<String, dynamic>?> getUserData() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid != null) {
        final doc = await _firestore.collection('users').doc(uid).get();
        return doc.data();
      }
      return null;
    } catch (e) {
      emit(AuthFailure('Failed to fetch user data'));
      return null;
    }
  }
}
