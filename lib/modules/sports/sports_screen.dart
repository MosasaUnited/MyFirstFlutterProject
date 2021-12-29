import 'package:flutter/cupertino.dart';

class SportsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sports News',
          style: TextStyle
          (
          fontWeight: FontWeight.bold,
          fontSize: 40.0,)
      ),
    );
  }
}
