import 'package:bloc/bloc.dart';
import 'package:firstflutter_project/layout/news_app/cubit/states.dart';
import 'package:firstflutter_project/modules/business/business_screen.dart';
import 'package:firstflutter_project/modules/science/science_screen.dart';
import 'package:firstflutter_project/modules/settings/settings_screen.dart';
import 'package:firstflutter_project/modules/sports/sports_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get (context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_soccer,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science_outlined,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

   void changeBottomNavBar(int index)
  {
    currentIndex = index;
    emit(NewsNavBottomState());
  }
}