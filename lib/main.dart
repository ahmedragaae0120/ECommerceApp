import 'package:ecommerceapp/core/Di/di.dart';
import 'package:ecommerceapp/core/api/api_manager.dart';
import 'package:ecommerceapp/my_app.dart';
import 'package:ecommerceapp/presentation/layouts/cubit/bloc_observer.dart';
import 'package:ecommerceapp/presentation/layouts/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  ApiManager.init();
  configureDependencies();
  runApp(BlocProvider(
    create: (context) => HomeViewmodel(),
    child: const MyApp(),
  ));
}
