import 'package:bloc/bloc.dart';
import 'package:hajzi/services/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;
  AuthCubit(this.authService) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final userId = await authService.login(email, password);
      emit(AuthSuccess(userId));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(String email, String password) async {
    emit(AuthLoading());
    try {
      final userId = await authService.register(email, password);
      emit(AuthSuccess(userId));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
