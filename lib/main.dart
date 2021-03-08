import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_sample/screens/primaryLogin.dart';
import 'package:flutter_login_sample/screens/secondaryLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/home': (context) => MyHomePage(),
        '/example1': (context) => PrimaryLogin(),
        '/example2': (context) => SecondaryLogin(),
      },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Examples'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                onPressed: () => Navigator.pushNamed(context, '/example1'),
                child: Text(
                  "Example 1",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                color: Theme.of(context).primaryColor,
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                onPressed: () => Navigator.pushNamed(context, '/example2'),
                child: Text(
                  "Example 2",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ));
  }
}
