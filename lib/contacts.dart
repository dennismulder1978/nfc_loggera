import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'items.dart';
//import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

void screen2() => runApp(SocialContacts());


class SocialContacts extends StatefulWidget {
  @override
  _SocialContactsState createState() => _SocialContactsState();
}

class _SocialContactsState extends State<SocialContacts> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SourceSansPro'),
      home: new Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(left: 5),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 70.0),
                child: Text('Sociale kaart',
                    style: TextStyle(
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white)),
              ),
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        drawer: new Drawer(
          child: new ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(left: 30, top: 10),
                height: 100,
                color: Colors.teal,
                child: new DrawerHeader(
                  child: Text(
                    'Instellingen',
                    style: TextStyle(
                        letterSpacing: 1.8,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                ),
              ),
              ListTile(
                title: listFunction(color: Colors.green[900], icon: Icons.contacts, listNaam: 'Contact toevoegen'),
                onTap: () {
                  // actie
                },
              ),
              ListTile(
                title: listFunction(color: Colors.blue[900], icon: Icons.contacts, listNaam: 'Contact wijzigen//'),
                onTap: () {
                  // actie
                },
              ),
              ListTile(
                title: listFunction(color: Colors.red[900], icon: Icons.contacts, listNaam: 'Contact (de)activeren'),
                onTap: () {
                  // actie
                },
              )

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange[700],
          highlightElevation: 6.0,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.nfc, color: Colors.white, size: 22),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text('Test')),
              // FlutterNfcReader.onTagDiscovered().listen(onData) {
              //   print(onData.id);
              //   print(onData.content);
              //   }
            ],
          ),
        ),
      ),
    );
  }
}
