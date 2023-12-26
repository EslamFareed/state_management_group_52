import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'theme_switch_state.dart';

class ThemeSwitchCubit extends Cubit<ThemeSwitchState> {
  ThemeSwitchCubit() : super(ThemeSwitchInitial());

  static ThemeSwitchCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeTheme(bool val) {
    isDark = val;
    emit(ChangeThemeState());
  }
}
