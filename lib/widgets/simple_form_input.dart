import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:licencias/styles/global_styles.dart';

class FormSimpleInput extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  IconData? icon;
  bool? hasIcon = false;
  TextInputFormatter? textFormatter;
  bool? hasFormat = false;
  TextInputType? textInputType = TextInputType.text;
  bool? textMultiline = false;
  FocusNode? focusNode;
  Widget? suffixIcon;
  Function(String)? onChanged;

  EdgeInsets? margin;

  BoxDecoration? decoration;

  int? maxLength;

  FormSimpleInput(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.textFormatter,
      this.hasFormat,
      this.textInputType,
      this.textMultiline,
      this.hasIcon,
      this.focusNode,
      this.suffixIcon,
      this.onChanged,
      this.icon,
      this.margin,
      this.decoration,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin != null
          ? margin
          : EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
      padding: EdgeInsets.only(left: 20, right: 20),
      height: textMultiline == true ? 200 : 54,
      decoration: decoration != null
          ? decoration
          : BoxDecoration(
              borderRadius: textMultiline == true
                  ? BorderRadius.circular(20)
                  : BorderRadius.circular(50),
              color: CustomColors.lightGrey,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: CustomColors.shadowWhite),
              ],
            ),
      child: TextFormField(
        maxLength: maxLength,
        autofocus: false,
        focusNode: focusNode,
        expands: textMultiline == true ? true : false,
        maxLines: null,
        keyboardType: textInputType,
        inputFormatters: hasFormat == true ? [textFormatter!] : [],
        controller: controller,
        cursorColor: CustomColors.subBlue,
        decoration: InputDecoration(
          icon: hasIcon == true
              ? Icon(
                  icon,
                  color: CustomColors.subBlue,
                )
              : null,
          hintText: hintText,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
