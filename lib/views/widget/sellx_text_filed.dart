// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/login_controller.dart';

class IsellTextField extends GetView<InnloggingControllerImp> {
  final void Function()? ontap, piconontap;
  final void Function(String)? onchanged, onsubmitted;
  dynamic hinttxt;
  //final TextEditingController? textEditingController;

  final dynamic icon;
  final double fontsizehinttext;
  final double height;
  final dynamic con,
      onSav,
      validater,
      contentpadding,
      paddingcontainer,
      cursorColor;
  final double width, borderR;
  final bool obs;
  final double borderwidth;
  dynamic alignment,
      picon,
      txttype,
      textInputAction,
      txtcolor,
      iconcolor,
      hinttxtcolor,
      bordersidecolor,
      float,
      label,
      focusNode,
      maxlines;

  IsellTextField(
      {this.alignment,
      this.paddingcontainer,
      this.cursorColor,
      this.onSav,
      this.validater,
      this.picon,
      this.maxlines,
      this.focusNode,
      required this.height,
      required this.width,
      this.txttype,
      this.hinttxt,
      this.bordersidecolor,
      this.txtcolor,
      this.icon,
      this.ontap,
      required this.borderR,
      this.hinttxtcolor,
      required this.borderwidth,
      required this.obs,
      this.con,
      this.float,
      required this.fontsizehinttext,
      this.contentpadding,
      this.label,
      this.onchanged,
      // this.textEditingController,
      this.piconontap,
      this.iconcolor,
      this.textInputAction,
      this.onsubmitted});

  @override
  Widget build(BuildContext context) {
    Get.put({InnloggingControllerImp});
    return Container(
      padding: paddingcontainer,
      alignment: alignment,
      child: TextFormField(
        maxLines: maxlines,
        focusNode: focusNode,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onFieldSubmitted: onsubmitted,
        textInputAction: textInputAction,
        controller: con,
        onChanged: onchanged,
        onTap: ontap,
        cursorWidth: width,
        cursorHeight: height,
        cursorColor: cursorColor,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: onSav,
        // controller: textEditingController,
        validator: validater,
        obscureText: obs,
        keyboardType: txttype,
        style: TextStyle(color: txtcolor),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: 11,
          ),
          contentPadding: contentpadding,
          label: label,
          floatingLabelBehavior: float,
          suffixIcon: icon,
          // prefixIcon: IconButton(
          //     onPressed: piconontap,
          //     icon: Icon(
          //       picon,
          //       color: iconcolor,
          //     )),
          hintText: hinttxt,
          hintStyle: GoogleFonts.roboto(
              color: hinttxtcolor, fontSize: fontsizehinttext),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            width: borderwidth,
            color: bordersidecolor,
          )),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: borderwidth,
                  color: bordersidecolor,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(borderR)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: borderwidth,
                  color: bordersidecolor,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(borderR)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: borderwidth,
                  color: bordersidecolor,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(borderR)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: borderwidth,
                  color: bordersidecolor,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(borderR)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: borderwidth,
                color: bordersidecolor,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(borderR),
          ),
        ),
      ),
    );
  }
}

class PasswordtextFild extends GetView<InnloggingControllerImp> {
  final double height;
  final double width, borderR;
  final bool obs;
  final double borderwidth;
  var onSav, con, validater;
  dynamic alignment,
      txttype,
      txtcolor,
      icon,
      iconcolor,
      hinttxt,
      hinttxtcolor,
      bordersidecolor;

  PasswordtextFild({
    this.alignment,
    required this.validater,
    required this.height,
    required this.width,
    this.txttype,
    this.hinttxt,
    this.bordersidecolor,
    this.txtcolor,
    this.icon,
    required this.borderR,
    this.hinttxtcolor,
    required this.borderwidth,
    required this.obs,
    required this.onSav,
    required this.con,
  });

  // get elseif => null;

  @override
  Widget build(BuildContext context) {
    Get.put({InnloggingControllerImp()});
    return Form(
      child: Container(
        alignment: alignment,
        child: SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validater,
            obscureText: obs,
            controller: con,
            onSaved: onSav,
            keyboardType: txttype,
            style: TextStyle(
              color: txtcolor,
            ),
            decoration: InputDecoration(
              suffixIcon: icon,
              hintText: hinttxt,
              hintStyle: GoogleFonts.roboto(color: hinttxtcolor),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                width: borderwidth,
                color: bordersidecolor,
              )),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: borderwidth,
                  color: bordersidecolor,
                ),
                borderRadius: BorderRadius.circular(borderR),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
