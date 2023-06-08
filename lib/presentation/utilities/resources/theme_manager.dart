import 'package:currency_app/presentation/utilities/resources/color_manager.dart';
import 'package:currency_app/presentation/utilities/resources/font_manager.dart';
import 'package:currency_app/presentation/utilities/resources/styles_manager.dart';
import 'package:currency_app/presentation/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() => ThemeData(
      fontFamily: FontConstants.fontFamily,
      backgroundColor: ColorManager.bg,
      scaffoldBackgroundColor: ColorManager.white,
      //Main Colors
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary,

      //Card View Theme
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.darkGrey,
        elevation: AppSize.s1_5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        /*margin: const EdgeInsets.symmetric(
          vertical: AppSize.s4,
          horizontal: AppSize.s4,
        ),*/
      ),

      //AppBar Theme
      appBarTheme: AppBarTheme(
        foregroundColor: ColorManager.grey,
        backgroundColor: ColorManager.bg,
        centerTitle: true,
        elevation: 0,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle: getBoldTextStyle(color: ColorManager.grey, fontSize: AppSize.s18),
      ),

      //Button Theme
      buttonTheme: ButtonThemeData(
          splashColor: ColorManager.lightPrimary,
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary),

      //Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getBoldTextStyle(
            color: ColorManager.white,
            fontSize: FontSize.s14,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p8,
            horizontal: AppPadding.p8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.s12,
            ),
          ),
          backgroundColor: ColorManager.primary,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: getBoldTextStyle(color: ColorManager.white, fontSize: FontSize.s14),
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p4,
            horizontal: AppPadding.p8,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s4), side: BorderSide(color: Colors.red)),
        ),
      ),

      // text theme
      textTheme: TextTheme(
        displayLarge: getLightTextStyle(color: ColorManager.black, fontSize: FontSize.s22),
        headlineLarge: getSemiBoldTextStyle(color: ColorManager.black, fontSize: FontSize.s16),
        titleMedium: getSemiBoldTextStyle(color: ColorManager.black, fontSize: FontSize.s14),
        titleLarge: getBoldTextStyle(color: ColorManager.black, fontSize: FontSize.s16),
        bodyLarge: getRegularTextStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
        bodySmall: getRegularTextStyle(color: ColorManager.black, fontSize: FontSize.s12),
        bodyMedium: getMediumTextStyle(color: ColorManager.black),
        headlineMedium: getRegularTextStyle(color: ColorManager.white, fontSize: FontSize.s16),
        displayMedium: getBoldTextStyle(color: ColorManager.white, fontSize: FontSize.s18),
        titleSmall: getSemiBoldTextStyle(color: ColorManager.black, fontSize: FontSize.s18),
        labelLarge: getBoldTextStyle(color: ColorManager.black, fontSize: FontSize.s22),
      ),

      //inputDecoration Theme (Text Form Field)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p20),
        hintStyle: getRegularTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        labelStyle: getMediumTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        counterStyle: getMediumTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularTextStyle(color: ColorManager.error),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.black, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.black, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    );
