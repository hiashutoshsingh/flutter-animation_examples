import 'package:flutter/material.dart';

class MyAnimationIcon extends StatefulWidget {
  final String appBarTitle;

  MyAnimationIcon({
    this.appBarTitle,
  });

  @override
  _MyAnimationIconState createState() => _MyAnimationIconState();
}

class _MyAnimationIconState extends State<MyAnimationIcon>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    /// setting listener on animation and
    /// getting its status all time when its state is changes
    _animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        Future.delayed(Duration(milliseconds: 500), () {
          _animationController.forward();
        });
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
            child: Wrap(
              children: [
                Column(
                  children: [
                    AnimatedIcon(
                      size: 64.0,
                      icon: AnimatedIcons.search_ellipsis,
                      progress: _animationController,
                      color: Colors.blue[900],
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    AnimatedIcon(
                      size: 64.0,
                      icon: AnimatedIcons.close_menu,
                      progress: _animationController,
                      color: Colors.blue[900],
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    AnimatedIcon(
                      size: 64.0,
                      icon: AnimatedIcons.menu_arrow,
                      progress: _animationController,
                      color: Colors.blue[900],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
