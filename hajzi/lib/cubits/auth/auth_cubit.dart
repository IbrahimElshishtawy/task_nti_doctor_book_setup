import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hajzi/cubits/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  bool _isLoading = false;

  AuthCubit(this._auth, this._firestore, this._googleSignIn)
    : super(AuthInitial());

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
        'uid': userCred.user!.uid,
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Registration failed'));
    }
  }

  /// تسجيل الدخول بالبريد وكلمة المرور
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailure(e.message ?? 'Login failed'));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      final GoogleSignInAccount account = await googleSignIn.authenticate();

      final GoogleSignInAuthentication auth = account.authentication;
      final String? accessToken = auth.accessToken;
      final String? idToken = auth.idToken;

      if (accessToken != null && idToken != null) {
        final credential = GoogleAuthProvider.credential(
          idToken: idToken,
          accessToken: accessToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        if (kDebugMode) {
          print('تم تسجيل الدخول بنجاح');
        }
      } else {
        if (kDebugMode) {
          print('فشل في الحصول على الرموز المميزة');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('خطأ: $e');
      }
    }
  }

  /// تسجيل الخروج
  Future<void> logout() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
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

  /// تحديث حالة التحميل
  void setLoading(bool value) {
    _isLoading = value;
    if (_isLoading) {
      emit(AuthLoading());
    } else {
      emit(AuthInitial());
    }
  }
}

extension on GoogleSignInAuthentication {
  String? get accessToken => null;
}
