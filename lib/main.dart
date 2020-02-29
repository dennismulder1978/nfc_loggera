import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfc_logger/NFC_register.dart';
import 'start.dart';
import 'contacts.dart';
import 'Berekeningen.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';

void main() => runApp(
      MyApp(),
    );

//theme: ThemeData(fontFamily: 'SourceSansPro'),

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'SourceSansPro',

        appBarTheme: AppBarTheme(
          color: kKleurAchterHeaderTekst,
        ),

          primaryTextTheme: TextTheme( // appbar top
            title: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
            ),
          ),

          canvasColor: kKleurAchterItems, // drawer kleur


          scaffoldBackgroundColor: kKleurAchterItems,
          textTheme: TextTheme(
            body1: TextStyle(
                // main scaffold
                fontWeight: FontWeight.w300,
                color: Colors.black54,
                fontSize: 18.0),
          ),

      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LogIn(),
        '/NFC': (context) => NfcRegister(),
        '/SOCIAL': (context) => SocialContacts(),
        '/CALCULATE': (context) => Berekeningen(),
      },
    );
  }
}
