import 'package:flutter/cupertino.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Science News',
        style: TextStyle
          (
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
        ),
      ),
    );
  }
}
