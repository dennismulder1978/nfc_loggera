import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'contacts.dart';
//import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

//Future navigateToSubPage(context) async {
//  Navigator.push(context, MaterialPageRoute(builder: (context) => contacts()));
//}


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
