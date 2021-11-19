import 'package:firstflutter_project/archived_tasks/archived_tasks_screen.dart';
import 'package:firstflutter_project/done_tasks/done_tasks_screen.dart';
import 'package:firstflutter_project/new_tasks/new_tasks_screen.dart';
import 'package:firstflutter_project/shared/compenents/compenents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';


class HomeLayout extends StatefulWidget {


  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomSheetShown = false;
  var fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    creatDatabase();
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Todo App',
        ),

      ),
      body: screens [currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: ()
        {
          if(isBottomSheetShown)
          {
            Navigator.pop(context);
            isBottomSheetShown = true;
            setState(()
            {
              fabIcon = Icons.edit;
            });
          }else
          {
            scaffoldKey.currentState?.showBottomSheet((context) =>
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:[
                      defaultFormField(
                        controller: titleController,
                        type: TextInputType.text,
                        validate: (String?value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'title must not be empty';
                          }
                          return null;
                        },
                        label: 'Task Title',
                        prefix: Icons.title,
                        onSubmit: (){},
                        onChange: (){}, onTap: (){}
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                          controller: timeController,
                          type: TextInputType.datetime,
                          onTap: ()
                          {
                            showTimePicker
                              (
                                initialTime: TimeOfDay.now(),
                                context: context,
                              ).then((value)
                            {
                              timeController.text = value!.format(context).toString();
                              print(value.format(context));
                            });
                          },
                          validate: (String? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'time must not be empty';
                            }
                            return null;
                          },
                          label: 'Task Time',
                          prefix: Icons.watch_later_outlined,
                          onSubmit: (){},
                          onChange: (){},
                        ),
                    ],


                  ),
                ));
          }
          isBottomSheetShown = true;
          setState(()
          {
            fabIcon = Icons.add;
          }
          );

        },
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar
        (
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index)
        {
          setState(() {
            currentIndex = index;
          });
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
  }
}

// 1. Creat DB
// 2. Open DB
// 3. Insert to DB
// 4. get from DB
// 5. Update in DB
// 6. Delete from DB

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
void insertToDatabase()
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