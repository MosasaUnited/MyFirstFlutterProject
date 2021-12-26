import 'package:bloc/bloc.dart';
import 'package:firstflutter_project/modules/counter/counter_screen.dart';
import 'package:firstflutter_project/modules/home/home_screen.dart';
import 'package:firstflutter_project/modules/messenger/messenger.dart';
import 'package:firstflutter_project/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'layout/home_layout1.dart';
import 'modules/bmi_result/bmi_resultscreen.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/counter/cubit/cubit.dart';
import 'modules/counter/cubit/states.dart';
import 'modules/login/login_screen.dart';
import 'package:firstflutter_project/modules/user/users_screen.dart';


void main()
{
  BlocOverrides.runZoned(
        () {
      // Use blocs...
          CounterCubit();
          CounterIntialState();

    },
    blocObserver: MyBlocObserver(),
  );
  runApp(MyApp());

}

// Class myApp

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext Context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : HomeLayout(),
    );

  }





}
