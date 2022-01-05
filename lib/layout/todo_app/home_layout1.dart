
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstflutter_project/archived_tasks/archived_tasks_screen.dart';
import 'package:firstflutter_project/done_tasks/done_tasks_screen.dart';
import 'package:firstflutter_project/new_tasks/new_tasks_screen.dart';
import 'package:firstflutter_project/shared/compenents/compenents.dart';
import 'package:firstflutter_project/shared/cubit/cubit.dart';
import 'package:firstflutter_project/shared/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';


// 1. Creat DB
// 2. Open DB
// 3. Insert to DB
// 4. get from DB
// 5. Update in DB
// 6. Delete from DB


class HomeLayout extends StatelessWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  // @override
  // void initState() {
  //   super.initState();
  //   creatDatabase();
  // }


  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context)=> AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state){
          if(state is AppInsertDatabaseState)
          {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state){
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),

            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                if (cubit.isBottomSheetShown)
                {
                  if (formKey.currentState!.validate())
                  {
                    cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    );
                  }
                } else
                {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(
                        20.0,
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultFormField(
                              controller: titleController,
                              type: TextInputType.text,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'title must not be empty';
                                }

                                return null;
                              },
                              label: 'Task Title',
                              prefix: Icons.title, onTap: () {},
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defaultFormField(
                              controller: timeController,
                              type: TextInputType.datetime,
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  timeController.text =
                                      value!.format(context).toString();
                                      print(value.format(context));
                                });
                              },
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'time must not be empty';
                                }

                                return null;
                              },
                              label: 'Task Time',
                              prefix: Icons.watch_later_outlined,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defaultFormField(
                              controller: dateController,
                              type: TextInputType.datetime,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2021-05-03'),
                                ).then((value) {
                                  dateController.text =
                                      DateFormat.yMMMd().format(value!);
                                });
                              },
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'date must not be empty';
                                }

                                return null;
                              },
                              label: 'Task Date',
                              prefix: Icons.calendar_today,
                            ),
                          ],
                        ),
                      ),
                    ),
                    elevation: 20.0,
                  )
                      .closed
                      .then((value)
                  {
                    cubit.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit,
                    );
                  });

                  cubit.changeBottomSheetState(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              },
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar
              (
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeIndex(index);
              },
              items:
              [
                BottomNavigationBarItem(icon:
                Icon(Icons.menu),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(icon:
                Icon(Icons.check_circle_outline_outlined,),
                  label: 'Done',
                ),
                BottomNavigationBarItem(icon:
                Icon(Icons.archive_outlined,),
                  label: 'Archived',
                ),
              ],
            ),

          );
        },

      ),
    );
  }
}

Future<String> getName() async
{
  return 'Omar Saad';
}
var dataBase;
void creatDatabase()
{
  dataBase = openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print ('Database Created');
        database.execute('CREAT TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, status TEXT)').then((value)
        {
          print('table crteated');

        }).catchError((error)
        {
          print('Error when creating the table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        print('Database Opened');
      }

  );
}
void insertToDatabase({title, date, time})
{
  dataBase.transaction((txn)
  {
    txn.rawInsert('INSERT INTO TASKS(title, date, time, status) VALUES("first task", "second", "third", "fourth",')
        .then((value) {
      print('$value inserted successfully');
    }).catchError((error) {
      print('Error When Inserting New Record ${error.toString()}');

    });
    return null;
  });
}