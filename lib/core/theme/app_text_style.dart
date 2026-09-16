import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/font_weight_helper.dart';

class AppTextStyle {
  static TextStyle font15OrangeBaseSemiBold = GoogleFonts.leagueSpartan(
    fontSize: 15,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.orangeBase,
  );
  static TextStyle font14OrangeBaseMedium = GoogleFonts.leagueSpartan(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.orangeBase,
  );
  static TextStyle font12OrangeBaseMedium = GoogleFonts.leagueSpartan(
    fontSize: 12,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.orangeBase,
  );
  static TextStyle font14OrangeBaseLight = GoogleFonts.leagueSpartan(
    fontSize: 14,
    fontWeight: FontWeightHelper.light,
    color: AppColors.orangeBase,
  );
  static TextStyle font14BlackLight = GoogleFonts.leagueSpartan(
    fontSize: 14,
    fontWeight: FontWeightHelper.light,
    color: Colors.black,
  );
  static TextStyle font12BlackLight = GoogleFonts.leagueSpartan(
    fontSize: 12,
    fontWeight: FontWeightHelper.light,
    color: Colors.black,
  );
  static TextStyle font24BlackSemiBold = GoogleFonts.leagueSpartan(
    fontSize: 24,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );
  static TextStyle font24WhiteMedium = GoogleFonts.leagueSpartan(
    fontSize: 24,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
  static TextStyle font14BlackMedium = GoogleFonts.leagueSpartan(
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
  static TextStyle font20BlackMedium = GoogleFonts.leagueSpartan(
    fontSize: 20,
    fontWeight: FontWeightHelper.medium,
    color: Colors.black,
  );
  static TextStyle font15GreyRegular = GoogleFonts.leagueSpartan(
    fontSize: 15,
    fontWeight: FontWeightHelper.regular,
    color: Colors.grey[600],
  );
  static TextStyle font17WhiteMedium = GoogleFonts.leagueSpartan(
    fontSize: 17,
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
  static TextStyle font24OrangeBaseBlack = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeightHelper.black,
    color: AppColors.orangeBase,
  );
  static TextStyle font28WhiteBold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.fontTwo,
  );
}
