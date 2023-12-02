import 'package:flutter_bloc/flutter_bloc.dart';

class TasbeehCubit extends Cubit<int>{
  TasbeehCubit() : super(0);
  
  void increment() => emit(state + 1);

  void reset() => emit(0);
}