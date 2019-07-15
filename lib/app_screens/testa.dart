import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestScreen extends StatelessWidget {
  final TextStyle textstyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_startapp.png"),
            fit: BoxFit.cover,
          )
        ),
        child: SingleChildScrollView(
          //padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[Expanded(
        flex: 1,
        child: Container(
          child: Column(children: <Widget>[
            Container(
                child: Image.asset('assets/arrow_back_white_18.png'), 
                alignment: Alignment.topLeft,
                margin: new EdgeInsets.only(left: 14.0, top: 10),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Cityguide', 
                style: TextStyle(fontFamily: 'Pacifico', color: Colors.white, fontSize: 50.0))
            )
            ])
        )
      ), 
      Expanded(
        flex: 2,
        child: Container(
          color: Colors.white,
          child: Container(
            margin: new EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Welcome back testR!', style: TextStyle(fontFamily: 'Lato', color: Color(0xff2196f3), fontSize: 26)),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(Icons.mail_outline),  
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(Icons.lock),  
                    labelText: 'Password',
                  ),
                )
              ]
            )
          ),
        )
      )
    ],
            ),
          ),
        ),
      ),
    );
  }
}