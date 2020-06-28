import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedPositioned extends StatefulWidget {
  final String appBarTitle;

  MyAnimatedPositioned({
    this.appBarTitle,
  });

  @override
  _MyAnimatedPositionedState createState() => _MyAnimatedPositionedState();
}

class _MyAnimatedPositionedState extends State<MyAnimatedPositioned> {
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
        child: Stack(
          children: <Widget>[
            animatedPositionedWidget(context),
          ],
        ),
      ),
    );
  }

  Widget animatedPositionedWidget(BuildContext context) {
    return AnimatedPositioned(
      width: (100.toDouble() + Random().nextInt(300).toDouble()),
      height: (50.toDouble() + Random().nextInt(400).toDouble()),
      top: 16 + Random().nextInt(128).toDouble(),
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOutBack,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(64),
          decoration: BoxDecoration(
            color: Colors.blue[900],
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
        ),
      ),
    );
  }

  void changeState() {
    setState(() {});
  }
}
