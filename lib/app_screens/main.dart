import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _TabProfileState extends State<TabProfile>{

  var _controllerEmail = new TextEditingController();
  var _controllerName = new TextEditingController();
  //final double headerSize = 180;

  @override
  void initState() {
    super.initState();
    _controllerName = new TextEditingController(text: 'Bryan Chauca H');
    _controllerEmail = new TextEditingController(text: 'bryan.chauca.6@gmail.com');
  }

  Widget _textField(String hintText, IconData iconData, TextEditingController textEditingController){
    return TextField(
      style: TextStyle(fontSize: 14.0),
      autofocus: false,
      controller:  textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 15),
        hintText: hintText,
        prefixIcon: Icon(iconData, size: 20),
      ),
    );
  }

  Widget _containerForm(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _textField('Name', Icons.person, _controllerName),
        SizedBox(height: 15),
        _textField('Email', Icons.email, _controllerEmail),
          SizedBox(height: 50),
          SizedBox(
          width: double.infinity,
          height: 40,
          child: RaisedButton(
              child: new Text("Update Profile"),
              textColor: Colors.white,
              color: Colors.blueAccent,
              elevation: 0.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              onPressed: () {
                
              }
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: RaisedButton(
              child: new Text("Log out"),
              textColor: Colors.white,
              color: Colors.redAccent,
              elevation: 0.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/start', (_) => false);
              }
            ),
          ),
          //SizedBox(height: 40)
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    double hCAvailable = (MediaQuery.of(context).size.height - kBottomNavigationBarHeight);

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background_startapp.png"),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Container(
                    height: hCAvailable * .35,
                    color: Colors.transparent
                  ),
                  new Container(
                    height: hCAvailable * .65,
                    color: Colors.white,
                    padding: EdgeInsets.only(right: 25, left: 25),
                    child: _containerForm()
                  )
                ],
              ),
              new Container(
                alignment: Alignment.topCenter,
                padding: new EdgeInsets.only(
                  top: hCAvailable * .22,
                  //right: 20.0,
                  //left: 20.0
                ),
                child: CachedNetworkImage(
                  imageUrl: "https://jetpack7.com/wp-content/uploads/2018/07/Dragon-Eye.jpg",
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                  imageBuilder: (context, imageProvider) => Container(
                    width: 160.0,
                    height: 160.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 5),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                    ),
                  )
                ),
                //)
              )
            ]
          )
        )
      )
    );
  }
}

class TabProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabProfileState();
  }
}

class TabBrowse extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(right: 25, left: 25),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _rowIcons("Restaurants", "Hotels", Icons.fastfood, Icons.hotel),
            _rowIcons("Nightlife", "Shopping", Icons.local_drink, Icons.shopping_basket),
            _rowIcons("Culture", "Popular", Icons.music_note, Icons.favorite_border),
          ])
      )
    );
  }

  Widget _rowIcons(String titleLeft, String titleRight, IconData iconLeft, IconData iconRight){
    return Row(
      children: <Widget>[
        Expanded(child: _containerIcon(titleLeft, iconLeft)),
        Expanded(child: _containerIcon(titleRight, iconRight)),
      ]
    );
  }
}

Widget _containerIcon(String title, IconData icon){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 0.5,
        color: Color(0xffb5b5b5)
      ),
      borderRadius:  BorderRadius.all(
        Radius.circular(5.0)
      )
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.only(top: 25, bottom: 25),
    child: Center(
      child: Column(
        children: <Widget>[
          Icon(icon, color: Colors.blue, size: 50),
          SizedBox(height: 5),
          Text(title, style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.center)
        ]
      )
    )
  );
}

class _MainState extends State<MainScreen> {
  final List<Widget> _children = [
    TabBrowse(),
    PlaceholderWidget(Colors.deepOrange),
    TabProfile()
    //Text('Bryan Chauca')
  ];

  static const List<String> _titles = ["Browse", "Favorites", "Profile"];

  int _currentIndex = 0;
  String titleApp = _titles.elementAt(0);
  bool showAppbar = true;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      titleApp = _titles.elementAt(index);
      if(index == 2){
        showAppbar = false;
      }else{
        showAppbar = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppbar == false ? null : AppBar(
        centerTitle: true,
        title: Text(titleApp)
      ),
      body: Center(child: _children[_currentIndex]),
      bottomNavigationBar: _navigation(),
    );
  }

  Widget _navigation(){
      return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.view_list),
            title: new Text(_titles.elementAt(0)),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text(_titles.elementAt(1)),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: new Text(_titles.elementAt(2))
          )
        ],
      );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
