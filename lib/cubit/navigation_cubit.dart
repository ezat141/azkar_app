

//part 'navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationItem { profile,favorites, search, home }

class NavigationCubit extends Cubit<NavigationItem> {
  NavigationCubit() : super(NavigationItem.home);

  void setNavigationItem(NavigationItem item) {
    emit(item);
  }
}//home, search, favorites, profile