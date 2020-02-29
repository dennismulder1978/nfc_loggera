import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welkom'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 75.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/NFC');
              },
              child: Container(
                  color: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(10),
                  child: Text('PUSH to go FURTHER')),
            ),

            SizedBox(height: 10.0,),
            Container(),
            SizedBox(height: 10.0,),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText:"PIN-code",
                    hintText: "Voer pin-code in",
                    icon: Icon(Icons.lock_outline)
                )
            )
          ],
        ),
      ),

    );
  }
}
