import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_final_eraasoft/tasks_bloc/cubit_observer.dart';
import 'package:todo_app_final_eraasoft/tasks_bloc/tasks_cubit.dart';


import 'Ui/screens/splash_screen.dart';
import 'api/dio_helper.dart';

void main() async {
  await DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashAnimatedScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

