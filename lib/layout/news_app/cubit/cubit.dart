import 'package:bloc/bloc.dart';
import 'package:firstflutter_project/layout/news_app/cubit/states.dart';
import 'package:firstflutter_project/modules/business/business_screen.dart';
import 'package:firstflutter_project/modules/science/science_screen.dart';
import 'package:firstflutter_project/modules/settings/settings_screen.dart';
import 'package:firstflutter_project/modules/sports/sports_screen.dart';
import 'package:firstflutter_project/shared/network/remote/dio_helper.dart';
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
  ];

  List<Widget> screens =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

   void changeBottomNavBar(int index)
  {
    currentIndex = index;
    if(index == 1);
    getSports();

    if(index == 2);
    getScience();
    emit(NewsNavBottomState());
  }

  List<dynamic> business = [];

   void getBusiness()
   {
     emit(NewsGetBusinessLoadingState());

     DioHelper.getData(url: 'v2/top-headlines',
       query: {
         'country' : 'eg',
         'category' : 'business',
         'apiKey' : 'ca212ae6d01b468586323faad1884a42',
       },
     ).then((value) {
       //print(value.data.toString());
       business = value.data['articles'];
       print(business[0]['title']);

       emit(NewsGetBusinessSuccessState());


     }).catchError((error){
       print(error.toString());
       emit(NewsGetBusinessErrorState(error.toString()));
     });
   }

  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    if(sports.length == 0)
    {
      DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'sports',
          'apiKey' : 'ca212ae6d01b468586323faad1884a42',
        },
      ).then((value) {
        //print(value.data.toString());
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());


      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }
    else
      {
        emit(NewsGetSportsSuccessState());
      }
  }

  List<dynamic> science = [];

  void getScience()
  {
    emit(NewsGetScienceLoadingState());

    if(science.length == 0)
    {
      DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'science',
          'apiKey' : 'ca212ae6d01b468586323faad1884a42',
        },
      ).then((value) {
        //print(value.data.toString());
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());


      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }else
      {
        emit(NewsGetScienceSuccessState());
      }
  }
}