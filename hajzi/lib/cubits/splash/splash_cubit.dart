import 'package:bloc/bloc.dart';
import 'splash_state.dart';
import 'dart:async';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startSplash() {
    emit(SplashLoading());
    Timer(const Duration(seconds: 3), () {
      emit(SplashFinished());
    });
  }
}
