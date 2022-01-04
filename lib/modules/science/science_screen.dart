import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutter_project/layout/news_app/cubit/cubit.dart';
import 'package:firstflutter_project/layout/news_app/cubit/states.dart';
import 'package:firstflutter_project/shared/compenents/compenents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, states){},
      builder: (context, states){
        var list = NewsCubit.get(context).science;
        return articleBuilder(list);
      },
    );
  }
}
