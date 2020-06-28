import 'dart:async';

import 'package:flutter/material.dart';

class MyAnimatedDefaultTextStyle extends StatefulWidget {
  final String appBarTitle;

  MyAnimatedDefaultTextStyle({
    this.appBarTitle,
  });

  @override
  _MyAnimatedDefaultTextStyleState createState() =>
      _MyAnimatedDefaultTextStyleState();
}

class _MyAnimatedDefaultTextStyleState
    extends State<MyAnimatedDefaultTextStyle> {
  bool defaultState = false;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(milliseconds: 1500), (Timer t) => changeState());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.appBarTitle.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: 120,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 500),
            style: TextStyle(
              fontSize: defaultState ? 90 : 60,
              color: defaultState ? Colors.blue[900] : Colors.red[900],
              fontWeight: defaultState ? FontWeight.bold : FontWeight.normal,
              letterSpacing: defaultState ? 1 : 0.1,
            ),
            child: Text('Charcha!'),
          ),
        ),
      ),
    );
  }

  void changeState() {
    setState(() {
      defaultState = !defaultState;
    });
  }
}
