import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          'Settings Screen',
          style: TextStyle
            (
            fontWeight: FontWeight.bold,
            fontSize: 40.0,)
      ),
    );
  }
}
