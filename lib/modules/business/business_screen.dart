import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Business News',
          style: TextStyle
            (
            fontWeight: FontWeight.bold,
            fontSize: 40.0,)
      ),
    );
  }
}
