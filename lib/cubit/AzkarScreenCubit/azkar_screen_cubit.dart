import 'package:bloc/bloc.dart';

import '../../models/azkar_azkar.dart';


class AzkarScreenCubit extends Cubit<List<Cont>> {
  AzkarScreenCubit(List<Cont> initialState) : super(initialState);

  void decrementRepeatCount(int index) {
    if (state[index].count > 0) {
      state[index].count--;

      // Update the visible list to remove items with count 0
      emit(List.from(state.where((adhkar) => adhkar.count > 0)));
    }
  }
}