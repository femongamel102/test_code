import 'package:bloc/bloc.dart';
import 'package:firstproject2022/layout/home_layout.dart';
import 'package:firstproject2022/modules/login/login_screen.dart';
import 'package:firstproject2022/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/counter/counter_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }

}