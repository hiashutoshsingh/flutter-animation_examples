import 'package:flutter/material.dart';

class MyDecoratedBoxTransition extends StatefulWidget {
  final String appBarTitle;

  MyDecoratedBoxTransition({
    this.appBarTitle,
  });

  @override
  _MyDecoratedBoxTransitionState createState() =>
      _MyDecoratedBoxTransitionState();
}

class _MyDecoratedBoxTransitionState extends State<MyDecoratedBoxTransition>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      })
      ..forward();
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
          alignment: Alignment.center,
          child: DecoratedBoxTransition(
            decoration: DecorationTween(
              begin: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(128),
              ),
              end: BoxDecoration(
                color: Colors.pink[900],
                borderRadius: BorderRadius.horizontal(),
              ),
            ).animate(_animationController),
            child: Container(
              width: 300,
              height: 300,
            ),
          )),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
