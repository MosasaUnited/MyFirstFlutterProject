import 'package:bloc/bloc.dart';
import 'package:firstflutter_project/modules/counter/counter_screen.dart';
import 'package:firstflutter_project/modules/home/home_screen.dart';
import 'package:firstflutter_project/modules/messenger/messenger.dart';
import 'package:firstflutter_project/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'layout/news_app/news_layout.dart';
import 'layout/todo_app/home_layout1.dart';
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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,

          ),

        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          elevation: 40.0,

        ),
      ),
      home : NewsLayout(),
    );

  }





}
