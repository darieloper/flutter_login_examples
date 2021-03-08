import 'package:flutter/material.dart';

class SecondaryLogin extends StatefulWidget {
  SecondaryLogin({Key key}) : super(key: key);

  _SecondaryLogin createState() => _SecondaryLogin();
}

class _SecondaryLogin extends State<SecondaryLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Example'),
      ),
    );
  }
}
