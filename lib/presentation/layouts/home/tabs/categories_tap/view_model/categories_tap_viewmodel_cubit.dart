import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_tap_viewmodel_state.dart';

class CategoriesTapViewmodelCubit extends Cubit<CategoriesTapViewmodelState> {
  CategoriesTapViewmodelCubit() : super(CategoriesTapViewmodelInitial());
}
