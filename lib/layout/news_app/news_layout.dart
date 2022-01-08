import 'package:firstflutter_project/layout/news_app/cubit/cubit.dart';
import 'package:firstflutter_project/layout/news_app/cubit/states.dart';
import 'package:firstflutter_project/shared/cubit/cubit.dart';
import 'package:firstflutter_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()..getScience()..getSports(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          var cubit = NewsCubit.get(context);

          return Scaffold
            (
            appBar: AppBar(
              title : Text(
                'News App',
              ),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search),),
                IconButton(onPressed: (){
                  AppCubit.get(context).changeAppMode();
                }, icon: Icon(Icons.brightness_2_outlined),),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
