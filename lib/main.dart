import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google SignIn Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Google SignIn Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleSignIn _googleSignIn;
  GoogleSignInAccount _googleSignInAccount;
  String displayName;
  String email;
  String photoUrl;

  Future<void> _login() async {
    _googleSignInAccount = await _googleSignIn.signIn();

    setState(() {
      displayName = _googleSignInAccount.displayName;
      email = _googleSignInAccount.email;
      photoUrl = _googleSignInAccount.photoUrl;
    });
  }

  Future<void> _logout() async {
    _googleSignInAccount = null;

    setState(() {
      displayName = null;
      email = null;
      photoUrl = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    _googleSignIn = GoogleSignIn();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: body(),
        ),
      ),
    );
  }

  List<Widget> body() {
    if (_googleSignInAccount == null) {
      return [
        RaisedButton(
          onPressed: _login,
          textColor: Colors.white,
          child: Text("Login with Google"),
          color: Colors.blue,
        )
      ];
    } else {
      return [
        ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: Image.network(photoUrl, width: 100, height: 100),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text("Welcome $displayName!", style: TextStyle(fontSize: 18)),
        ),
        Text(email, style: TextStyle(fontSize: 12)),
        Container(
            margin: EdgeInsets.only(top: 35),
            child: RaisedButton(
              onPressed: _logout,
              textColor: Colors.white,
              child: Text("Logout"),
              color: Colors.red,
            ))
      ];
    }
  }
}
