import 'package:flutter/material.dart';

Widget defaultButton({
 double width = double.infinity,
  double height = 40.0,
  Color background = Colors.red,
  required String text,
  required Function function,

}) =>
Container(
width: width,
height: height,
color: background,
child: MaterialButton(
onPressed: (){function;},
child: Text(
text.toUpperCase(),
style: TextStyle(
color: Colors.white,
),

),),
);

Widget defaultFormField({
 required TextEditingController controller,
 required TextInputType type,
 Function? onSubmit,
 Function? onChange,
 required validate,
 required String label,
 bool isPassWord = false,
 required IconData prefix,
 IconData? suffix,
 suffixPressed, required Function() onTap,
}) => TextFormField(
controller: controller,
keyboardType: type,
obscureText: isPassWord,
validator: validate,
decoration: InputDecoration(
labelText: label,
prefixIcon: Icon(
prefix,

),
 suffixIcon: suffix != null ? IconButton(
   onPressed: suffixPressed, icon: Icon(suffix),
 )  : null,
border: OutlineInputBorder(),
),
);


