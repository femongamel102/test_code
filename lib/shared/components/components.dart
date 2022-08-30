import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstproject2022/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

//Login
Widget defaultButton({
  bool isUpperCase = true,
  double width = double.infinity,
  final Color? color = Colors.blue,
  final VoidCallback? onPressed,
  required String text,
  double radius = 10,
}) =>
    Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(color: Colors.white),
          ),
        ));

//

Widget defaultTextFormField({
  bool isClickable = true,
  required TextEditingController controller,
  final TextInputType? keyboardType,
  VoidCallback? onTap,
  required String labelText,
  ValueChanged<String>? onChanged,
  IconData? prefixIcon,
  bool obscureText = false,
  IconData? suffixIcon,
  final VoidCallback? suffixPressed,
  ValueChanged<String>? onFieldSubmitted,
  FormFieldValidator<String>? validator,
  isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      onChanged: onChanged,
      enabled: isClickable,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffixIcon),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget buildSeparator() => Container(
      height: 1.0,
      width: double.infinity,
      color: Colors.grey[300],
    );

Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  onDismissed: (direction){
    AppCubit.get(context).deleteData(id: model['id']);
  },
  child:   Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              child: Text('${model['time']}'),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${model['title']}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${model['date']}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'done', id: model['id']);
                },
                icon: Icon(
                  Icons.check_box,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'archive', id: model['id']);
                },
                icon: Icon(
                  Icons.archive,
                  color: Colors.black45,
                ))
          ],
        ),
      ),
);

Widget tasksBuilder({
  required List<Map> tasks,
})=>ConditionalBuilder(
  condition: tasks.isNotEmpty,
  builder: (context) => ListView.separated(
      itemBuilder: (context, index) =>
          buildTaskItem(tasks[index], context),
      // separator make line after item
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsetsDirectional.only(start: 20.0),
        child: Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[300],
        ),
      ),
      itemCount: tasks.length),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.menu,
          size: 100,
          color: Colors.grey,
        ),
        Text("No Tasks Yet, Please Add Some Tasks",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey
          ),)
      ],
    ),
  ),
);