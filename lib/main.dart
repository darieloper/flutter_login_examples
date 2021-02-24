import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final TextEditingController _usernameController =
      new TextEditingController(text: 'bradpitt');
  final TextEditingController _emailController =
      new TextEditingController(text: 'bradpitt@gmail.com');
  final TextEditingController _passwordController =
      new TextEditingController(text: 'somePassword');
  int remember;

  @override
  void initState() {
    super.initState();
    remember = 1;
  }

  void _handleRadioValueChanged(int value) {
    setState(() {
      remember = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottomOpacity: 0.0,
          backgroundColor: Colors.blue.shade600,
          elevation: 0.0,
          title: Container(
            child: Text(
              'Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 4),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 30),
            child:
                IconButton(icon: Icon(Icons.arrow_back), onPressed: () => {}),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.white12,
              width: MediaQuery.of(context).size.width,
              child: ClipPath(
                child: Container(
                  color: Colors.blue.shade600,
                  height: 200,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(40, 30, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('New',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text('Account',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white)),
                        ],
                      )),
                ),
                clipper: DiagonalClipPath(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey.shade300)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 10, 50, 20),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: 'Email Address',
                                labelStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey.shade300)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(50, 10, 50, 20),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: PasswordFormField(
                            controller: _passwordController,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey.shade300)),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                          child: Row(
                            children: [
                              RawMaterialButton(
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                fillColor: Colors.blue.shade500,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.blue.shade500,
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () => {},
                              ),
                              Expanded(
                                  child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Radio(
                                      value: 1,
                                      groupValue: remember,
                                      onChanged: (val) {
                                        _handleRadioValueChanged(val);
                                      },
                                      toggleable: true,
                                    ),
                                  ),
                                  GestureDetector(
                                    dragStartBehavior: DragStartBehavior.down,
                                    child: Text(
                                      'Remember Me',
                                      style: TextStyle(
                                          color: Colors.grey.shade700),
                                    ),
                                    onTap: () => {
                                      this.setState(() {
                                        this.remember =
                                            (this.remember == 1) ? null : 1;
                                      })
                                    },
                                  )
                                ],
                              )),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'or',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.grey.shade500),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                          child: Align(
                              alignment: Alignment.center,
                              child: RawMaterialButton(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                onPressed: () => {},
                                fillColor: Colors.blue.shade700,
                                shape: RoundedRectangleBorder(
                                    side:
                                        BorderSide(color: Colors.blue.shade700),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.asset(
                                      'images/facebook_f_48.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                    Expanded(
                                        child: Text(
                                      'connect with Facebook',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ))
                                  ],
                                ),
                              )))
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  PasswordFormField({Key key, this.controller, this.labelText = 'Password'})
      : super(key: key);

  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool hidePassword = true;

  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: this.hidePassword,
      decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: Colors.grey.shade500, fontWeight: FontWeight.bold),
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            dragStartBehavior: DragStartBehavior.down,
            child: Padding(
                child: Text(
                  this.hidePassword ? "SHOW" : "HIDE",
                  style: TextStyle(
                      color: Colors.blue.shade500, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.only(top: 15)),
            onTap: () =>
                setState(() => (this.hidePassword = !this.hidePassword)),
          )),
    );
  }
}

class DiagonalClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height - 40)
      ..arcToPoint(Offset(size.width - 30, size.height - 20),
          radius: Radius.circular(30))
      ..lineTo(30, size.height - 40)
      ..arcToPoint(Offset(0, size.height - 70), radius: Radius.circular(30))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}

class HomeClipPath extends CustomClipper<Path> {
  Path drawHearth(Size size) {
    var path = Path();

    path.moveTo(size.width / 2, size.height / 2);
    var start = Offset(size.width / 2 - 50, size.height / 2 - 50);
    var end = Offset(size.width / 2 - 100, size.height / 2);
    path.quadraticBezierTo(start.dx, start.dy, end.dx, end.dy);

    var start2 = Offset(size.width / 2 - 177, size.height / 2 + 100);
    var end2 = Offset(size.width / 2, size.height / 2 + 230);
    path.quadraticBezierTo(start2.dx, start2.dy, end2.dx, end2.dy);

    path.moveTo(size.width / 2, size.height / 2);
    var start3 = Offset(size.width / 2 + 50, size.height / 2 - 50);
    var end3 = Offset(size.width / 2 + 100, size.height / 2);
    path.quadraticBezierTo(start3.dx, start3.dy, end3.dx, end3.dy);

    var start4 = Offset(size.width / 2 + 177, size.height / 2 + 100);
    var end4 = Offset(size.width / 2, size.height / 2 + 230);
    path.quadraticBezierTo(start4.dx, start4.dy, end4.dx, end4.dy);

    return path;
  }

  @override
  Path getClip(Size size) {
    return this.drawHearth(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
