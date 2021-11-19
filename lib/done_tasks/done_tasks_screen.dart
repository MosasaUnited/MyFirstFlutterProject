import 'package:flutter/material.dart';

class DoneTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'New Done Tasks',
        style: TextStyle(
          fontSize: 35.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,

        ),
      ),
    );
  }
}
