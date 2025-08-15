import 'package:flutter_bloc/flutter_bloc.dart';
import '../../pages/auth/google/auth_service.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthService _authService;

  UserCubit(this._authService) : super(UserInitial());

  Future<void> fetchUserData(String userId) async {
    try {
      emit(UserLoading());
      final user = await _authService.getUserData(userId);
      if (user != null) {
        emit(UserLoaded(user));
      } else {
        emit(UserError("User not found"));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  void clearUser() {
    emit(UserInitial());
  }
}
