import 'package:bloc/bloc.dart';
import 'user_state.dart';
import '../../services/auth_service.dart';

class UserCubit extends Cubit<UserState> {
  final AuthService authService;
  UserCubit(this.authService) : super(UserInitial());

  Future<void> getUser(String userId) async {
    emit(UserLoading());
    try {
      final user = await authService.getUserData(userId);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
