import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ), onPressed: () {},
        ),
        title: Text(
          ' My First App'
        ), centerTitle: true, elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
            ), onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_active
            ), onPressed: () {},
          ),
        ],
      ),
      body:
       Row(
         children: [
           Expanded(
             child: Container(
               color: Colors.blue,
               child: Text(
                 'Zain',
                 style: TextStyle(
                   fontSize: 27.0,
                   color: Colors.white,
                   fontStyle: FontStyle.italic,
                 ),
               ),
             ),
           ),
           Expanded(
             child: Container(
               color: Colors.pinkAccent,
               child: Text(
                 'Lara',
                 style: TextStyle(
                   fontSize: 27.0,
                   color: Colors.white,
                   fontStyle: FontStyle.italic,
               ),
               ),
             ),
           ),
           Expanded(
             child: Container(
               color: Colors.purpleAccent,
               child: Text(
                 'Nora',
                 style: TextStyle(
                   fontSize: 27.0,
                   color: Colors.white,
                   fontStyle: FontStyle.italic,
                 ),
               ),
             ),
           ),
           Expanded(
             child: Container(
               color: Colors.black,
               child: Text(
                 'Mostafa',
                 style: TextStyle(
                   fontSize: 27.0,
                   color: Colors.white,
                   fontStyle: FontStyle.italic,
                 ),
               ),
             ),
           ),
         ],
       ),

    );
  }
}
