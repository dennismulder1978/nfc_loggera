import 'package:flutter/material.dart';
import 'items.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';
//import 'main.dart';
import 'Constants.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NfcRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 5),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(right: 70.0),
              child: Text('Key logger'),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: kKleurAchterHeaderTekst,
              padding: EdgeInsets.only(left: 30, top: 10),
              height: 100,
              child: DrawerHeader(
                child: Text(
                  'Instellingen',
                  style: kStyleVoorDrawerHeaderTekst,
                ),
              ),
            ),
            ListTile(
              title: ListFunction(
                  icon: Icons.account_circle,
                  iconKleur: Colors.black,
                  listNaam: 'Account wijzigen'),
              onTap: () {
                // actie
              },
            ),
            ListTile(
              title: ListFunction(
                  icon: Icons.supervised_user_circle,
                  iconKleur: Colors.green[900],
                  listNaam: 'Gebruiker toevoegen'),
              onTap: () {
                // actie
              },
            ),
            ListTile(
              title: ListFunction(
                  icon: Icons.supervised_user_circle,
                  iconKleur: Colors.red[900],
                  listNaam: 'Gebruiker (de)activeren'),
              onTap: () {
                // actie
              },
            ),
            ListTile(
              title: ListFunction(
                  iconKleur: Colors.blue[900],
                  icon: Icons.nfc,
                  listNaam: 'Tag wijzigen'),
              onTap: () {
                // actie
              },
            ),
            ListTile(
              title: ListFunction(
                  iconKleur: Colors.blue[900],
                  icon: Icons.nfc,
                  listNaam: 'Tag (de)activeren'),
              onTap: () {
                // actie
              },
            ),
            ListTile(
              title: ListFunction(
                  iconKleur: Colors.blue[900],
                  icon: Icons.nfc,
                  listNaam: 'Tag volgorde wijzigen'),
              onTap: () {
                // actie
              },
            ),
            ListTile(
              title: ListFunction(
                  iconKleur: Colors.black,
                  icon: Icons.library_books,
                  listNaam: 'Log inzien'),
              onTap: () {
                // actie
              },
            ),
            ListTile(
              title: ListFunction(
                  iconKleur: Colors.pink,
                  icon: Icons.accessibility,
                  listNaam: 'Extra testen'),
              onTap: () {
                // actie
              },
            )
          ],
        ),
      ),
//        floatingActionButton:
//
//        FloatingActionButton(
//          backgroundColor: Colors.orange[700],
//          highlightElevation: 6.0,
//          onPressed: () {
//
//          },
//          child: Icon(Icons.contacts, color: Colors.white, size: 22),
//        ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            KeyItemNFC('Hoofdsleutel', 'Dennis', '30 minuten'),
            KeyItemNFC('Leenfiets sleutel', 'Hannah', '1 uur'),
            KeyItemNFC('Parkeerkaart 1', 'Beschikbaar', '2 uur'),
            KeyItemNFC('Parkeerkaart 2', 'Beschikbaar', '45 minuten'),
            KeyItemNFC('Kastsleutels kamer 0.29', 'Beschikbaar', '5 dagen'),
            KeyItemNFC('Kastsleutels kamer 0.32', 'Esther', '2 uur'),

            // NfcScan(),

            // FlutterNfcReader.onTagDiscovered().listen(onData) {
            //   print(onData.id);
            //   print(onData.content);
            //   }
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        GestureDetector(
          child: Icon(
            Icons.nfc,
            color: Colors.blue,
            size: 50.0,
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, '/NFC');
          },
        ),
        GestureDetector(
          child: Icon(
            Icons.contacts,
            color: Colors.black,
            size: 50.0,
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, '/SOCIAL');
          },
        ),
        GestureDetector(
          child: Icon(
            Icons.apps,
            color: Colors.black,
            size: 50.0,
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, '/CALCULATE');
          },
        ),
      ],
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
