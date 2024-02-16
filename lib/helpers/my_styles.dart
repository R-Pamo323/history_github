import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_github/helpers/my_colors.dart';

class MyStyles {
  static TextStyle poppinsGeneral = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: MyColors.colorWhite,
  );

  static TextStyle poppinsText =
      GoogleFonts.poppins(color: MyColors.colorWhite);

  static TextStyle poppinsDate = GoogleFonts.poppins(
      color: MyColors.colorWhite, fontWeight: FontWeight.bold);

  static TextStyle poppinsAppBar = GoogleFonts.poppins(
      color: MyColors.colorPrincipal,
      fontSize: 25,
      fontWeight: FontWeight.bold);
}
