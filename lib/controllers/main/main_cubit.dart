import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  int counter = 0;

  void incerment() {
    counter++;
    emit(IncrementState());
  }

  void decerment() {
    counter--;
    emit(DecrementState());
  }
}
