import 'package:flutter/material.dart';

class ArchivedTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'New Archived Task',
        style: TextStyle(
          fontSize: 35.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,

        ),
      ),
    );
  }
}
