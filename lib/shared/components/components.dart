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
  required TextEditingController controller,
  final TextInputType? keyboardType,
  Function? onSubmit,
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
      decoration:  InputDecoration(
        labelText: labelText ,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffixIcon),
        ) : null,
        border: OutlineInputBorder(),
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
