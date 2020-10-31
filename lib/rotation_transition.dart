import 'package:flutter/material.dart';

class MyRotationTransition extends StatefulWidget {
  final String appBarTitle;

  const MyRotationTransition({Key key, this.appBarTitle}) : super(key: key);
  @override
  _MyRotationTransitionState createState() => _MyRotationTransitionState();
}

class _MyRotationTransitionState extends State<MyRotationTransition> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    /// creates animation controller with [Duration] 2 seconds and [Ticker Provider] for current context
    _animationController = AnimationController(duration: Duration(seconds: 2), vsync: this)..repeat(reverse: true);

    /// sets actual animation
    _animation = CurvedAnimation(curve: Curves.fastOutSlowIn, parent: _animationController);
  }

  @override
  void dispose() {
    /// disposes the animation controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.appBarTitle.toUpperCase(),
          style: TextStyle(color: Colors.white, letterSpacing: 1, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: FlutterLogo(size: 150),
        ),
      ),
    );
  }
}
