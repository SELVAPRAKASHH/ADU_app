/*
 * This computer program, as defined in the Copyright, Designs and Patents Act 1998 and the Software Directive (2009/24/EC), is the copyright of Logic Valley Ltd, a wholly owned subsidiary of Marston (Holdings) Ltd. All rights are reserved.
 */

import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class ColorConstants {
  static Color getStatusBarColor() {
    String color = "#CCCCCC";
    return  Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color getStatusBarColorII() {
    //String color = "#B6B6B8"; // #E5E5E5
    String color = "#6D1144";
    return  Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color getRebrandStatusBarColor() {
    String color = "#12284C";
    return  Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color getSplashbgColorWhite() {
    String color = "#FFFFFF";
    return  Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color hexToColor(String code) {
    return  Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color getAccentColor() {
    // String color = "#880E4F";
    // Rebranding color
    String color = "#005E85";
    return  Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }

static Color getAccentColorII() {
    String color = "#2c95b5";
    return  Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
}

// rebranding color
static Color getAccentColorDark() {
    String color = "#12284C";
    return  Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }
  /*static TextStyle _textFieldHeaderTextStyle() {
    return GoogleFonts.montserrat(
      fontWeight: FontWeight.w700,
      fontSize: 13,
      color: Colors.black

        );
  }*/
  static Color getCheckboxColor() {
    // String color = "#880E4F";
    // Rebranding color
    String color = "#415565";
    return  Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }

}
