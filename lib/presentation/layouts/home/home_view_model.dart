import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewmodel extends Cubit<HomeStates> {
  HomeViewmodel() : super(HomeInitialState());

  static HomeViewmodel get(context) => BlocProvider.of(context);
  int currenteTapIndex = 0;
  changeBottomNavTap(int newIndex) {
    if (currenteTapIndex == newIndex) return;
    currenteTapIndex = newIndex;
    emit(HomechangeTapState());
  }
}

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomechangeTapState extends HomeStates {}
