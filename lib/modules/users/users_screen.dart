import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';



class UsersScreen extends StatelessWidget {

  final List<UserModel> users =[
    UserModel(
        id: 1,
        name: 'femon',
        phone: '1298847841'
    ),
    UserModel(
        id: 2,
        name: 'gamel',
        phone: '1298847841'
    ),
    UserModel(
        id: 3,
        name: 'shawky',
        phone: '1298847841'
    ),
    UserModel(
        id: 4,
        name: 'boles',
        phone: '1298847841'
    ),
    UserModel(
        id: 5,
        name: 'botros',
        phone: '1298847841'
    ),
    UserModel(
        id: 6,
        name: 'saleb',
        phone: '1298847841'
    ),
    UserModel(
        id: 7,
        name: 'EL Kawy',
        phone: '1298847841'
    ),
  ];



  UsersScreen({Key? key}) : super(key: key);@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (context,index)=>buildUserItem(users[index]),
          separatorBuilder: (context,index)=> Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: Container(
            width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ), itemCount: users.length)
    );
  }

  Widget buildUserItem(UserModel users)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
         CircleAvatar(
          radius: 25,
          child: Text(
            '${users.id}',
            style:const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),

          ),
        ),
        const SizedBox(width: 20,),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              users.name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              users.phone,
              style: const TextStyle(
                  color: Colors.grey
              ),
            ),
          ],
        )
      ],
    ),
  );
}
