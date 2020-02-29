//import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'items.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';

class SocialContacts extends StatefulWidget {
  @override
  _SocialContactsState createState() => _SocialContactsState();
}

class _SocialContactsState extends State<SocialContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(left: 5),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 70.0),
                child: Text('Sociale kaart',
                    ),
              ),
            ),
          ),

        ),
        drawer: new Drawer(
          child: new ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 30, top: 10),
                height: 100,
                color: kKleurAchterHeaderTekst,
                child: DrawerHeader(
                  child: Text(
                    'Instellingen',
                    style: kStyleVoorDrawerHeaderTekst,
                  ),
                ),
              ),
              ListTile(
                title: ListFunction(iconKleur: Colors.green[900], icon: Icons.contacts, listNaam: 'Contact toevoegen'),
                onTap: () {
                  // actie
                },
              ),
              ListTile(
                title: ListFunction(iconKleur: Colors.blue[900], icon: Icons.contacts, listNaam: 'Contact wijzigen'),
                onTap: () {
                  // actie
                },
              ),
              ListTile(
                title: ListFunction(iconKleur: Colors.red[900], icon: Icons.contacts, listNaam: 'Contact (de)activeren'),
                onTap: () {
                  // actie
                },
              )

            ],
          ),
        ),

        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              KeyItemSocial(persoonName: 'Malle Babbe', persoonEmail: 'email', persoonTelefoonnummer: 522155, persoonWebSite: 'www.www.nl',),
              KeyItemSocial(persoonName: 'Rooie Ronnie', persoonTelefoonnummer: 6561316, persoonWebSite: 'adkfkadngk', persoonEmail: 'askfn@ajsf.nl',),
            ],
          ),
        ),


        persistentFooterButtons:

        <Widget>[
          GestureDetector(
            child: Icon(Icons.nfc, color: Colors.black, size: 50.0,),
            onTap: (){
              Navigator.popAndPushNamed(context, '/NFC');
            },
          ),
          GestureDetector(
            child: Icon(Icons.contacts, color: Colors.blue, size: 50.0,),
            onTap: (){
              Navigator.popAndPushNamed(context, '/SOCIAL');
            },
          ),
          GestureDetector(
            child: Icon(Icons.apps, color: Colors.black, size: 50.0,),
            onTap: (){
              Navigator.popAndPushNamed(context, '/CALCULATE');
            },
          ),
        ],

    );
  }
}
