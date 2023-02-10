import 'package:flutter/material.dart';
import 'package:klshimol_task/core/managers/color_manager.dart';
import 'package:klshimol_task/core/managers/font_manager.dart';
import 'package:klshimol_task/core/managers/styles_manager.dart';
import 'package:klshimol_task/core/managers/values_manager.dart';

ThemeData getApplicationThemeData() {
  return ThemeData(
    fontFamily: FontConstants.robotoFontFamily,

    //main Colors
    primaryColor: ColorManager.primary,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: ColorManager.secondary,
      primarySwatch: Colors.green,
      primaryColorDark: ColorManager.primary,
    ).copyWith(
      secondary: ColorManager.secondary,
    ),
    primaryColorLight: ColorManager.primary,
    primaryColorDark: ColorManager.primary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primary,

    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(
        fontSize: FontSize.s18,
        color: ColorManager.white,
      ),
    ),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        colorScheme: ColorScheme.fromSwatch(
                accentColor: ColorManager.secondary,
                primaryColorDark: ColorManager.primary)
            .copyWith(
          secondary: ColorManager.secondary,
        ),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    //elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSize.s14,
        ),
        padding: const EdgeInsets.all(
          AppPadding.p16,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s8,
          ),
        ),
      ),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 16.0,
      ),

      // hint style
      hintStyle: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s16,
      ),
      labelStyle: getMediumStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      errorStyle: getRegularStyle(
        color: ColorManager.error,
      ),

      // enabled border style (grey)
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey.withOpacity(1),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),

      // focused border style(primary)
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          //  width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),

      // error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.error,
          //  width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),

      // focused border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          // width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppSize.s8,
          ),
        ),
      ),
    ),
  );
}
