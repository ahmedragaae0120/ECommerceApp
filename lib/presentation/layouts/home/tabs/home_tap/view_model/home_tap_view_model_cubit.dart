import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_tap_view_model_state.dart';

class HomeTapViewModelCubit extends Cubit<HomeTapViewModelState> {
  HomeTapViewModelCubit() : super(HomeTapViewModelInitial());
}
