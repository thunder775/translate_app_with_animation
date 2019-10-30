import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this, value: 0);
    controller.addListener(() {
      print(controller.value);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4E85F0),
        leading: Icon(
          Icons.menu,
          size: 25,
        ),
        title: Row(
          children: <Widget>[
            Text(
              'Google',
              style: TextStyle(fontSize: 26, fontFamily: 'Product Sans'),
            ),
            Text(
              ' Translate',
              style: TextStyle(fontFamily: 'Product Sans'),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                AlignTransition(
                  child: LanguageWidget(),
                  alignment:
                      Tween(begin: Alignment.topRight, end: Alignment.topLeft)
                          .animate(controller),
                ),

                Positioned(
                  top: 0,
                  right: 2,
                  left: 2,
                  child: RotationTransition(
                    turns: controller,
                    child: IconButton(color: Color(0xFF4E85F0),
                      onPressed: () {
                        if (controller.value == 0) {
                          controller.forward();
                        } else
                          controller.reverse();
                      },
                      iconSize: 35,
                      icon: Icon(Icons.swap_horiz),
                    ),
                  ),
                ),
                AlignTransition(
                  child: LanguageWidget(),
                  alignment:
                      Tween(begin: Alignment.topLeft, end: Alignment.topRight)
                          .animate(controller),
                ),
              ],
            ),
            Container(
                height: 1, width: double.infinity, color: Color(0xFFDBDBDB))
          ],
        ),
      ),
    );
  }
}

class LanguageWidget extends StatefulWidget {
  String _value;

  @override
  _LanguageWidgetState createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: [
        DropdownMenuItem(
          value: 1,
          child: Text(
            'English',
            style: TextStyle(color: Color(0xFF4E85F0)),
          ),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text(
            'Hebrew',
            style: TextStyle(color: Color(0xFF4E85F0)),
          ),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text(
            'Indonesian',
            style: TextStyle(color: Color(0xFF4E85F0)),
          ),
        )
      ],
      onChanged: (value) {
        widget._value = value;
      },
      value: widget._value,
    );
  }
}
