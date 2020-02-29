import 'package:flutter/material.dart';
//import 'items.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Berekeningen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(left: 5),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 70.0),
                child: Text('Berekeningen'),
              ),
            ),
          ),

        ),
//
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(child: Text('Test')),

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
            child: Icon(Icons.contacts, color: Colors.black, size: 50.0,),
            onTap: (){
              Navigator.popAndPushNamed(context, '/SOCIAL');
            },
          ),
          GestureDetector(
            child: Icon(Icons.apps, color: Colors.blue, size: 50.0,),
            onTap: (){
              Navigator.popAndPushNamed(context, '/CALCULATE');
            },
          ),
        ],

    );
  }
}
