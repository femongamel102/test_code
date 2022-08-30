import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstproject2022/shared/components/components.dart';
import 'package:firstproject2022/shared/cubit/cubit.dart';
import 'package:firstproject2022/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if(state is AppInsertDatabaseState){
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit
                        .insertToDatabase(
                            title: titleController.text,
                            time: timeController.text,
                            date: dateController.text);
                  }
                } else {
                  scaffoldKey.currentState
                      ?.showBottomSheet(
                          elevation: 15,
                          (context) => Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(20),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      defaultTextFormField(
                                        controller: titleController,
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "title must not be empty";
                                          }
                                          return null;
                                        },
                                        labelText: "Task Title",
                                        prefixIcon: Icons.title,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      defaultTextFormField(
                                        controller: timeController,
                                        keyboardType: TextInputType.none,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "time must not be empty";
                                          }
                                          return null;
                                        },
                                        onTap: () {
                                          showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                              .then((value) {
                                            timeController.text =
                                                value!.format(context);
                                            print(value);
                                            print(value.format(context));
                                          });
                                        },
                                        labelText: "Task Time",
                                        prefixIcon: Icons.watch_later_outlined,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      defaultTextFormField(
                                        controller: dateController,
                                        keyboardType: TextInputType.none,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "date must not be empty";
                                          }
                                          return null;
                                        },
                                        onTap: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.parse(
                                                      "2000-12-24"),
                                                  lastDate: DateTime.now())
                                              .then((value) {
                                            print(DateFormat.yMMMd()
                                                .format(value!));
                                            dateController.text =
                                                DateFormat.yMMMd()
                                                    .format(value);
                                          });
                                        },
                                        labelText: "Task Date",
                                        prefixIcon: Icons.calendar_today,
                                      )
                                    ],
                                  ),
                                ),
                              ))
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  label: 'Tasks',
                  icon: Icon(
                    Icons.menu,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Done',
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Archived',
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                ),
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
