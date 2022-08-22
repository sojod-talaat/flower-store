import 'package:flutter/material.dart';

Widget defultMaterialButton({
  double? width,
  double? height,
  Color backColor = const Color(0xFF031956),
  double borderRadius = 25,
  double fontsize = 20,
  Color ColorText: Colors.white,
  String? text,
  VoidCallback? function,
}) =>
    Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        color: backColor,
        hoverColor: Colors.black,
        onPressed: function,
        child: Text(
          text!,
          style: TextStyle(
              fontSize: fontsize,
              color: ColorText,
              fontWeight: FontWeight.bold),
        ),
      ),
    );

//TextFormField

Widget defulutTextFormFild({
  TextEditingController? controller,
  FormFieldValidator? validator,
  TextInputType? type,
  String? labeltext,
  String? hintText,
  IconData? suffix,
  Widget? prefix,
  //bool? obscureText,
  bool? secirty,
  VoidCallback? suffixFun,
  ValueChanged<String>? onChanged,
  VoidCallback? onTap,
  Function? onSubmited,
  TextStyle? style,
}) =>
    TextFormField(
      style: style,
      validator: validator,
      controller: controller,
      keyboardType: type,
      // obscureText: obscureText!,
      onChanged: onChanged,
      onFieldSubmitted: (x) => onSubmited,
      onTap: onTap,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0xFF031956)),
          borderRadius: BorderRadius.circular(25.0),
        ),
        border: OutlineInputBorder(),
        labelText: labeltext,
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFF8D8E98)),
        labelStyle: TextStyle(color: const Color(0xFF031956)),
        prefixIcon: prefix,
        suffixIcon: IconButton(
            icon: Icon(suffix, color: const Color(0xFF031956)),
            onPressed: suffixFun),
      ),
    );
Widget defultTextButton(
        {required String text, required VoidCallback onPressed}) =>
    TextButton(
        onPressed: onPressed,
        child: Text(
          text,
        ));
