import 'package:flutter/material.dart';

class NewTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'New Task',
        style: TextStyle(
          fontSize: 35.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,

        ),
      ),
    );
  }
}
