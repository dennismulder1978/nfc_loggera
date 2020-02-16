// import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

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

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange[700],
          highlightElevation: 6.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SocialContacts()),
            );
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

class KeyItem extends StatefulWidget {
  final String keyName;
  final String personName;
  final String timePast;
  const KeyItem(this.keyName, this.personName, this.timePast);

  @override
  _KeyItemState createState() => _KeyItemState();
}

class _KeyItemState extends State<KeyItem> {
  Widget staatvanpersoon(personName) {
    if (personName == 'Beschikbaar') {
      return Text(personName,
          style: TextStyle(
              color: Colors.green[800], fontSize: 13.0, letterSpacing: 1.0));
    } else {
      return Text(personName,
          style: TextStyle(
              color: Colors.red[900], fontSize: 13.0, letterSpacing: 1.0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          new Container(
            height: 65,
            padding: EdgeInsets.fromLTRB(15, 12, 10, 10),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        child: new Text(
                          widget.keyName,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.1),
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.only(left: 10, top: 4),
                        child: Text('sinds ' + widget.timePast,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10,
                                fontStyle: FontStyle.italic)),
                      ),
                    ],
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(left: 5, top: 2),
                  child: new Container(
                    padding: EdgeInsets.fromLTRB(4, 6, 0, 0),
                    child: Container(
                      child: staatvanpersoon(widget.personName),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black12,
            height: 0.5,
          ),
        ],
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

Container listFunction({color: Colors, icon: Icons, String listNaam}) {
  return Container(
    child: Row(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(right: 7),
            child: Icon(icon, color: color, size: 18)),
        Text(listNaam, style: TextStyle(color: Colors.black54)),
      ],
    ),
  );
}

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
