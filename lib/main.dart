import 'package:bloc/bloc.dart';
import 'package:firstflutter_project/modules/counter/counter_screen.dart';
import 'package:firstflutter_project/modules/home/home_screen.dart';
import 'package:firstflutter_project/modules/messenger/messenger.dart';
import 'package:firstflutter_project/shared/bloc_observer.dart';
import 'package:firstflutter_project/shared/cubit/cubit.dart';
import 'package:firstflutter_project/shared/cubit/states.dart';
import 'package:firstflutter_project/shared/network/local/cache_helper.dart';
import 'package:firstflutter_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'layout/todo_app/home_layout1.dart';
import 'modules/bmi_result/bmi_resultscreen.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/counter/cubit/cubit.dart';
import 'modules/counter/cubit/states.dart';
import 'modules/login/login_screen.dart';
import 'package:firstflutter_project/modules/user/users_screen.dart';
import 'package:dio/dio.dart';

void main() async
{
  // السطر ده بيتأكد ان كل حاجة هنا فى الميثود خلصت و بعدين بتفتح فى الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
        () {
      // Use blocs...
          CounterCubit();
          CounterIntialState();

    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark!));

}

// Class myApp

class MyApp extends StatelessWidget
{

  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext Context)
  {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()..getScience()..getSports(),),
        BlocProvider(create: (BuildContext context) => AppCubit()..changeAppMode(
  fromShared: isDark,)
      )],
      child: BlocConsumer<AppCubit, AppStates>
        (
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
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
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,

                ),

              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 40.0,

              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,

                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor(
                  '273746'
              ),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor(
                      '273746'
                  ),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor(
                    '273746'
                ),
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,

                ),

              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor(
                    '273746'
                ),
                elevation: 40.0,

              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,

                ),
              ),

            ),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home :
            Directionality(
                textDirection: TextDirection.ltr,
                child: NewsLayout()),
          );
        },

      ),
    );

  }





}
