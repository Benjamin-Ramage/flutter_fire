import 'package:flutter/material.dart';
import 'package:flutter_fire/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle get body {
    return GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: AppColors.red,
      ),
    );
  }

  static TextStyle get forgotPassword {
    return GoogleFonts.montserrat(
      textStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    );
  }

  static TextStyle get link {
    return GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: AppColors.red,
        fontSize: 17.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static TextStyle get suggestion {
    return GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: AppColors.grey,
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }



  static TextStyle get error {
    return GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: AppColors.red,
        fontSize: 12.0,
      ),
    );
  }

  static TextStyle get buttonTextLight {
    return GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: AppColors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle get buttonTextDark {
    return GoogleFonts.montserrat(
      textStyle: TextStyle(
        color: AppColors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}