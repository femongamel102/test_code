import 'package:flutter/material.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'New Tasks Screen',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),));
  }
}
