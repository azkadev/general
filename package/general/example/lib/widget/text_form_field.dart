import 'package:flutter/material.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData prefixIconData;
  final Color color;
  final TextEditingController? controller;
  final String? Function(String? data)? validator;
  final bool readOnly;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function(String value)? onChanged;
  final int? maxLines;
  const TextFormFieldWidget({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIconData = Icons.people,
    this.color = Colors.white,
    this.controller,
    this.validator,
    this.readOnly = false,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLines = 1,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: context.theme.indicatorColor,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      readOnly: readOnly,
      obscureText: obscureText,
      maxLines: maxLines,
      style: TextStyle(
        shadows: [
          BoxShadow(
            color: context.theme.shadowColor.withAlpha(110),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        // color: Colors.black,
      ),
      onChanged: onChanged,
      clipBehavior: Clip.antiAlias,
      
      decoration: InputDecoration(
      
        contentPadding: const EdgeInsets.all(0.0),
        hintText: hintText,
        labelText: labelText,
        labelStyle: context.theme.textTheme.labelSmall,
        hintStyle: TextStyle(
          // color: Colors.grey,
          fontSize: 14.0,

          shadows: [
            BoxShadow(
              color: context.theme.shadowColor.withAlpha(110),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        prefixIcon: Icon(
          prefixIconData,
          color: context.theme.indicatorColor,
          size: 18,
          shadows: [
            BoxShadow(
              color: context.theme.shadowColor.withAlpha(110),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        suffixIcon: suffixIcon,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.focusColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.focusColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: context.theme.textTheme.labelMedium,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.focusColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.focusColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.theme.indicatorColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
          
        ),
      ),
    );
  }
}
