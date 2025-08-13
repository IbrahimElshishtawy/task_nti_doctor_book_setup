import '../../models/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSignedIn extends AuthState {
  final UserModel user;
  AuthSignedIn(this.user);
}

class AuthSignedOut extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
