import 'package:flutter/material.dart';

class MyAnimationBuilder extends StatefulWidget {
  final String appBarTitle;

  MyAnimationBuilder({
    this.appBarTitle,
  });

  @override
  _MyAnimationBuilderState createState() => _MyAnimationBuilderState();
}

class _MyAnimationBuilderState extends State<MyAnimationBuilder> with TickerProviderStateMixin {
  Animation _heartbeatAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    /// initializing AnimationController
    _animationController = AnimationController(
      vsync: this,

      /// duration is the period of time the animation would last
      duration: Duration(
        seconds: 1,
      ),
    );

    /// Tween is to configure an animation to interpolate to a different range or data type
    /// A CurvedAnimation defines progression as a non-linear curve.
    _heartbeatAnimation = Tween(begin: 180.0, end: 165.0).animate(
      CurvedAnimation(
        curve: Curves.easeOutBack,
        parent: _animationController,
      ),
    );

    /// setting listener on animation and
    /// getting its status continuously everytime when its state changes
    _animationController.addStatusListener(
      (AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      },
    );

    /// forward starts the animation
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

                  /// size varies from given range in Tween
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
