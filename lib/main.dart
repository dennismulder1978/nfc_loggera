//import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
import 'items.dart';
import 'contacts.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                child: Text('Key logger',
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
                title: listFunction(color: Colors.black, icon: Icons.account_circle, listNaam: 'Account wijzigen'),
                onTap: () {
                  // actie
                },
              ),
              ListTile(
                title: listFunction(color: Colors.green[900], icon: Icons.supervised_user_circle, listNaam: 'Gebruiker toevoegen'),
                onTap: () {
                  // actie
                },
              ),
              ListTile(
                title: listFunction(color: Colors.red[900], icon: Icons.supervised_user_circle, listNaam: 'Gebruiker (de)activeren'),
                onTap: () {
                  // actie
                },
              ),
              ListTile(
                title: listFunction(color: Colors.blue[900], icon: Icons.nfc, listNaam: 'Tag wijzigen'),
                onTap: () {
                  // actie
                },
              ),
              ListTile(
                title: listFunction(color: Colors.blue[900], icon: Icons.nfc, listNaam: 'Tag (de)activeren'),
                onTap: () {
                  // actie
                },
              ),
              ListTile(
                title: listFunction(color: Colors.blue[900], icon: Icons.nfc, listNaam: 'Tag volgorde wijzigen'),
                onTap: () {
                  // actie
                },
              ),
              ListTile(
                title: listFunction(color: Colors.black, icon: Icons.library_books, listNaam: 'Log inzien'),
                onTap: () {
                  // actie
                },
              ),
              ListTile(
                title: listFunction(color: Colors.pink, icon: Icons.accessibility, listNaam: 'Extra testen'),
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
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => SocialContacts()));
          },
          child: Icon(Icons.contacts, color: Colors.white, size: 22),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              KeyItem('Hoofdsleutel', 'Dennis', '30 minuten'),
              KeyItem('Leenfiets sleutel', 'Hannah', '1 uur'),
              KeyItem('Parkeerkaart 1', 'Beschikbaar', '2 uur'),
              KeyItem('Parkeerkaart 2', 'Beschikbaar', '45 minuten'),
              KeyItem('Kastsleutels kamer 0.29', 'Beschikbaar', '5 dagen'),
              KeyItem('Kastsleutels kamer 0.32', 'Esther', '2 uur'),

              NfcScan(),

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


class NfcScan extends StatefulWidget {
  NfcScan({Key key}) : super(key: key);

  @override
  _NfcScanState createState() => _NfcScanState();
}

class _NfcScanState extends State<NfcScan> {
  TextEditingController writerController = TextEditingController();

  @override
  initState() {
    super.initState();
    writerController.text = 'Flutter NFC Scan';
    FlutterNfcReader.onTagDiscovered().listen((onData) {
      print(onData.id);
      print(onData.content);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    writerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: writerController,
        ),
        RaisedButton(
          onPressed: () {
            FlutterNfcReader.read();
          },
          child: Text("Read"),
        ),
        RaisedButton(
          onPressed: () {
            FlutterNfcReader.write(" ", writerController.text).then((value) {
              print(value.content);
            });
          },
          child: Text("Write"),
        )
      ],
    );
  }
}

