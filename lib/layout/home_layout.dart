import 'package:firstproject2022/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:firstproject2022/modules/done_tasks/done_tasks_screen.dart';
import 'package:firstproject2022/modules/new_tasks/new_tasks_screen.dart';
import 'package:flutter/material.dart';
class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> screens =[
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){


        },
        child: const Icon(
          Icons.add
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index){
          setState((){
            currentIndex = index;
            print(currentIndex);
          });
          },
        items: const [
          BottomNavigationBarItem(
              label:'Tasks' ,
              icon: Icon(
            Icons.menu,
          ),
          ),
          BottomNavigationBarItem(
            label:'Done' ,
            icon: Icon(
              Icons.check_circle_outline,
            ),
          ),
          BottomNavigationBarItem(
            label:'Archived' ,
            icon: Icon(
              Icons.archive_outlined,
            ),
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
