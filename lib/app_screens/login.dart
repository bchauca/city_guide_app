import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _LoginScreen());
  }
}

class _TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
            child: Column(children: <Widget>[
          Container(
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset('assets/arrow_back_white_18.png')),
            alignment: Alignment.topLeft,
            margin: new EdgeInsets.only(left: 14.0, top: 10),
          ),
          Align(
              alignment: Alignment.center,
              child: Text('Cityguide',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                      fontSize: 50.0)))
        ])));
  }
}

class _BottomScreen extends StatelessWidget {
  Widget _innerContainer(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Welcome back!',
              style: TextStyle(
                  fontFamily: 'Lato', color: Color(0xff2196f3), fontSize: 30)),
          Container(
            child: TextField(
              style: TextStyle(fontFamily: 'Lato', fontSize: 14.0),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontFamily: 'Lato'),
                labelStyle: TextStyle(fontFamily: 'Lato'),
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(Icons.mail_outline, size: 20),
                labelText: 'Email',
                //hintText: 'Your email address'
              ),
            ),
            margin: EdgeInsets.only(top: 30),
          ),
          Container(
        	child: TextField(
            style: TextStyle(fontFamily: 'Lato', fontSize: 14.0),
            obscureText: true,
            decoration: InputDecoration(
                hintStyle: TextStyle(fontFamily: 'Lato'),
                labelStyle: TextStyle(fontFamily: 'Lato'),
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(Icons.lock, size: 20),
                labelText: 'Password',
                //hintText: 'Your password'
              ),
            ),
            margin: EdgeInsets.only(top: 15),
          ),
          Container(
            width: double.infinity,
            height: 35,
            child: OutlineButton(
                child: new Text("Login"),
                textColor: Colors.blueAccent,
                borderSide: BorderSide(color: Colors.blueAccent),
                color: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/main', (_) => false);
                }),
            margin: EdgeInsets.only(top: 30),
          ),
          Container(
            width: double.infinity,
            height: 35,
            child: RaisedButton(
                child: new Text("Facebook"),
                textColor: Colors.white,
                color: Colors.blueAccent,
                elevation: 0.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/main', (_) => false);
                }),
            margin: EdgeInsets.only(top: 15, bottom: 20),
          ),
          Text('Forgot password?',
              style: TextStyle(
                  fontFamily: 'Lato', color: Color(0xff727272), fontSize: 13)),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child:  Container(
          height: double.infinity,
          color: Colors.white,
          padding: new EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
          child: Center( child: _innerContainer(context) )
        )
    );
  }
}

class _LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background_startapp.png"),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
            //padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SafeArea(child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[_TopScreen(), _BottomScreen()])))));
  }
}
