import 'package:flutter/material.dart';

class MyPositionedTransition extends StatefulWidget {
  final String appBarTitle;

  MyPositionedTransition({
    this.appBarTitle,
  });

  @override
  _MyPositionedTransitionState createState() => _MyPositionedTransitionState();
}

class _MyPositionedTransitionState extends State<MyPositionedTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<RelativeRect> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      })
      ..forward();

    _animation = new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(64.0, 400.0, 64.0, 100.0),
      end: new RelativeRect.fromLTRB(150.0, 100.0, 150.0, 400.0),
    ).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeIn,
          reverseCurve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
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
      body: Stack(alignment: Alignment.center, children: <Widget>[
        PositionedTransition(
          rect: _animation,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue[900],
            ),
          ),
        )
      ]),
    );
  }
}
