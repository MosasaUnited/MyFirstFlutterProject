import 'package:flutter/material.dart';

class Counter extends StatefulWidget {

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
int counter = 1;

@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter',
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              setState(() {

              });
              counter++;
              print(counter);
            }, child: Text(
              '+',
                  style: TextStyle(
                    fontSize: 60.0,
                    color: Colors.blueAccent,
                  ),
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$counter',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 60.0,
                    ),
              ),
            ),
            TextButton(onPressed: (){
              setState(() {

              });
              counter--;
              print(counter);
            }, child: Text(
              '-',
              style: TextStyle(
                fontSize: 60.0,
                color: Colors.blueAccent,
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
