import 'package:flutter/material.dart';

class MyAnimationBuilder extends StatefulWidget {
  final String appBarTitle;

  MyAnimationBuilder({
    this.appBarTitle,
  });

  @override
  _MyAnimationBuilderState createState() => _MyAnimationBuilderState();
}

class _MyAnimationBuilderState extends State<MyAnimationBuilder>
    with TickerProviderStateMixin {
  Animation _heartbeatAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );

    /// defining type of animation
    _heartbeatAnimation = Tween(begin: 180.0, end: 165.0).animate(
      CurvedAnimation(
        curve: Curves.easeOutBack,
        parent: _animationController,
      ),
    );

    /// setting listener on animation and
    /// getting its status all time when its state is changes
    _animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationController.repeat();
      }
    });

    /// to start the animation
    _animationController.forward();
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
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Center(
            child: Container(
              child: Center(
                child: Icon(
                  Icons.favorite,
                  color: Colors.blue[900],

                  /// size changes as per set in Tween
                  size: _heartbeatAnimation.value,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
