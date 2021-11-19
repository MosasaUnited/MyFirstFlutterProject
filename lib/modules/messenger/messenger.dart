import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('https://scontent.faly2-1.fna.fbcdn.net/v/t1.18169-9/10444706_720320411339616_6159220849240231831_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=97-T65q-FpMAX_LoqSG&_nc_oc=AQkV3p6BvXCJNCvOkTDYDzZI6sYztNQLvrEpr1EFHmYWYAonmH-_tDbV4XyD510RUb8&_nc_ht=scontent.faly2-1.fna&oh=04b119c1d9dab3d2efefeac290e8008c&oe=61832DBC'),

            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                fontSize: 25.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: CircleAvatar(
            backgroundColor: Colors.redAccent,
            radius: 15.0,
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 16.0,
            ),
          ),),
          IconButton(onPressed: (){}, icon: CircleAvatar(
            backgroundColor: Colors.redAccent,
            radius: 15.0,
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 16.0,
            ),
          ),),
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    children: [
                     Icon(
                        Icons.search,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 17.0,
                        ),

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildStoryItem(),
                    itemCount: 5,
                    separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                    ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20.0,
                  ),
                  itemCount: 15,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

Widget buildChatItem() => Row(
  children: [
    Stack(
        alignment: Alignment.bottomRight,
        children:[
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
              'https://scontent.faly2-1.fna.fbcdn.net/v/t1.18169-9/10444706_720320411339616_6159220849240231831_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=97-T65q-FpMAX_LoqSG&_nc_oc=AQkV3p6BvXCJNCvOkTDYDzZI6sYztNQLvrEpr1EFHmYWYAonmH-_tDbV4XyD510RUb8&_nc_ht=scontent.faly2-1.fna&oh=04b119c1d9dab3d2efefeac290e8008c&oe=61832DBC',
            ),
          ),
          CircleAvatar(
            radius: 9.0,
            backgroundColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.red,
            ),
          ),
        ]),
    SizedBox(
      height: 6.0,
    ),
    Text(
      'Mostafa Mahmoud Saad Ali',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14.0,
      ),

    ),
  ],
);

Widget buildStoryItem() => Column(
  children: [
    Stack(
        alignment: Alignment.bottomRight,
        children:[
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
              'https://scontent.faly2-1.fna.fbcdn.net/v/t1.18169-9/10444706_720320411339616_6159220849240231831_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=97-T65q-FpMAX_LoqSG&_nc_oc=AQkV3p6BvXCJNCvOkTDYDzZI6sYztNQLvrEpr1EFHmYWYAonmH-_tDbV4XyD510RUb8&_nc_ht=scontent.faly2-1.fna&oh=04b119c1d9dab3d2efefeac290e8008c&oe=61832DBC',
            ),
          ),
          CircleAvatar(
            radius: 9.0,
            backgroundColor: Colors.white,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.red,
            ),
          ),
        ]),
    SizedBox(
      height: 6.0,
    ),
    Text(
      'Mostafa Mahmoud Saad Ali',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14.0,
      ),

    ),
  ],
);
