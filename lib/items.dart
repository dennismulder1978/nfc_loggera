import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class KeyItemNFC extends StatelessWidget {
  final String keyName;
  final String personName;
  final String timePast;
  KeyItemNFC(this.keyName, this.personName, this.timePast);

  Widget staatVanPersoon(personName) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Container(
                  child: Row(
                    children: <Widget>[
                       Container(
                        child: Text(
                          keyName,
                          style: TextStyle(fontSize: 15.0),
                          ),
                      ),
                       Container(
                        padding: EdgeInsets.only(left: 10, top: 4),
                        child: Text('sinds ' + timePast,
                            textAlign: TextAlign.end,
                            style: TextStyle(
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
                      child: staatVanPersoon(personName),
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

class KeyItemSocial extends StatelessWidget {
  final String persoonName;
  final String persoonEmail;
  final int persoonTelefoonnummer;
  final String persoonWebSite;
  KeyItemSocial({@required this.persoonName, this.persoonEmail, this.persoonTelefoonnummer, this.persoonWebSite });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            //height: 65,
            padding: EdgeInsets.fromLTRB(15, 12, 10, 10),
            child: Container(
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(persoonName, style: TextStyle(fontSize: 17.0),),
                      Text(persoonEmail, style: TextStyle(fontSize: 13.0),),
                      Text(persoonTelefoonnummer.toString(), style: TextStyle(fontSize: 13.0),),
                      Text(persoonWebSite, style: TextStyle(fontSize: 13.0),),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    //color: Colors.brown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(

                            child: Icon(Icons.phone_forwarded, size: 40.0, color: Colors.green,),
                            onTap: (){
                              //actie
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(

                            child: Icon(Icons.email, size: 40.0, color: Colors.blue[700],),
                            onTap: (){
                              //actie
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(

                            child: Icon(Icons.web_asset, size: 40.0, color: Colors.red[800],),
                            onTap: (){
                              //actie
                            },
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
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

class ListFunction extends StatelessWidget {
  final IconData icon;
  final String listNaam;
  final Color iconKleur;

  ListFunction(
      {@required this.icon, @required this.iconKleur, @required this.listNaam});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(right: 7),
              child: Icon(icon, color: iconKleur, size: 18)),
          Text(listNaam),
        ],
      ),
    );
  }
}

class BottomCare extends StatelessWidget {
  final IconData icon;
  final String location;
  final Color bottomIcoonKleur;
  final Function goToTheRightPlace;

  BottomCare({@required this.icon, @required this.location, @required this.bottomIcoonKleur, @required this.goToTheRightPlace});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(icon, color: bottomIcoonKleur, size: 50.0,),
      onTap: (){
        Navigator.popAndPushNamed(context, location);
      },

    );
  }
}
