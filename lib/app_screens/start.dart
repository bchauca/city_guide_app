import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
            body: //SafeArea(
              /*child:*/ Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background_startapp.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(child: 
                  Column(children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Cityguide', 
                          style: TextStyle(fontFamily: 'Pacifico', color: Colors.white, fontSize: 50.0)
                        ),
                      )
                    ),
                    Expanded(
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Explore the best places of the world\u0027s most vibrant cities!', 
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontFamily: 'Lato', fontSize: 14))
                              ),
                              margin: new EdgeInsets.all(10.0)
                          )
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(width: double.infinity, height: 42, child: RaisedButton(child: new Text("Login"), textColor: Colors.blueAccent, color: Colors.white, elevation: 0, shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)), onPressed: (){
                                Navigator.of(context).pushNamed('/login');
                              })),
                              SizedBox(width: double.infinity, height: 42, child: OutlineButton(child: new Text("Register"), textColor: Colors.white, borderSide: BorderSide(color: Colors.white), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)), onPressed: (){}))
                            ])
                        ),
                      ])
                    )
                  ]), margin: new EdgeInsets.all(40.0))
                ),
              )
            //),
          );
    }
}