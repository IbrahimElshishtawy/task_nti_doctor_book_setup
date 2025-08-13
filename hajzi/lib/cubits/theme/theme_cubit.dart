import 'package:bloc/bloc.dart';
import 'theme_state.dart';
import '../../themes/light_theme.dart';
import '../../themes/dark_theme.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightThemeState(lightTheme));

  void toggleTheme(bool isDark) {
    if (isDark) {
      emit(DarkThemeState(darkTheme));
    } else {
      emit(LightThemeState(lightTheme));
    }
  }
}
