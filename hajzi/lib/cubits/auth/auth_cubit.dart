import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/user_model.dart';
import '../../services/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(AuthInitial());

  Future<void> signUp(
    String name,
    String email,
    String password,
    String role,
  ) async {
    emit(AuthLoading());
    try {
      UserModel? user = await _authService.signUp(name, email, password, role);
      if (user != null) {
        emit(AuthSignedIn(user));
      } else {
        emit(AuthError("Sign up failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      UserModel? user = await _authService.signIn(email, password);
      if (user != null) {
        emit(AuthSignedIn(user));
      } else {
        emit(AuthError("Sign in failed"));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      emit(AuthSignedOut());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void checkCurrentUser() {
    final user = _authService.getCurrentUser();
    if (user != null) {
      // لو حابب تجيب بياناته من Firestore ممكن تعدل هنا
      emit(
        AuthSignedIn(
          UserModel(
            id: user.uid,
            name: user.displayName ?? "",
            email: user.email ?? "",
            role: "", // هتحتاج تجيب الدور من Firestore لو مهم
          ),
        ),
      );
    } else {
      emit(AuthSignedOut());
    }
  }
}
