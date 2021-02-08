import 'package:credible/app/shared/palette.dart';
import 'package:credible/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  ThemeData get _themeData {
    final themeData = ThemeData(
      brightness: Brightness.light,
      backgroundColor: Palette.background,
      primaryColor: Palette.blue,
      accentColor: Palette.blue,
      textTheme: TextTheme(
        subtitle1: GoogleFonts.poppins(
          color: Palette.text,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
        subtitle2: GoogleFonts.poppins(
          color: Palette.text,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
        bodyText1: GoogleFonts.montserrat(
          color: Palette.text,
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        ),
        bodyText2: GoogleFonts.montserrat(
          color: Palette.text,
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        button: GoogleFonts.poppins(
          color: Palette.text,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
        overline: GoogleFonts.montserrat(
          color: Palette.text,
          fontSize: 10.0,
          letterSpacing: 0.0,
        ),
        caption: GoogleFonts.montserrat(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

    return themeData;
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Credible',
        initialRoute: '/splash',
        theme: _themeData,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
      ).modular();
}
