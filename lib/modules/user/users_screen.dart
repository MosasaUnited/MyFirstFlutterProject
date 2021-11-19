import 'package:firstflutter_project/models/user/user%20models.dart';
import 'package:flutter/material.dart';



class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Mostafa Mahmoud Saad',
      phone: '01224774051',
    ),
    UserModel(
      id: 2,
      name: 'Mahmoud Saad Ali',
      phone: '01223369787',
    ),
    UserModel(
      id: 3,
      name: 'Nora Moatasem',
      phone: '01211874004',
    ),
    UserModel(
      id: 1,
      name: 'Mostafa Mahmoud Saad',
      phone: '01224774051',
    ),
    UserModel(
      id: 2,
      name: 'Mahmoud Saad Ali',
      phone: '01223369787',
    ),
    UserModel(
      id: 3,
      name: 'Nora Moatasem',
      phone: '01211874004',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]) ,
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
          itemCount: users.length,
      ),
    );
  }
  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),
        SizedBox(
          width: 25.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
