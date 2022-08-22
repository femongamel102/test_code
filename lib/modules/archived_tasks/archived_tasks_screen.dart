import 'package:flutter/material.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Archived Tasks Screen',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ));
  }
}
