import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedPadding extends StatefulWidget {
  final String appBarTitle;

  MyAnimatedPadding({
    this.appBarTitle,
  });

  @override
  _MyAnimatedPaddingState createState() => _MyAnimatedPaddingState();
}

class _MyAnimatedPaddingState extends State<MyAnimatedPadding> {
  bool selected = false;
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            AnimatedPadding(
              padding: EdgeInsets.only(
                top: Random().nextInt(100).toDouble(),
                bottom: Random().nextInt(100).toDouble(),
                left: Random().nextInt(100).toDouble(),
                right: Random().nextInt(100).toDouble(),
              ),
              duration: Duration(
                milliseconds: 800,
              ),
              curve: Curves.easeInOut,
              child: Container(
                padding: EdgeInsets.all(
                  64,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeState() {
    setState(() {});
  }
}
