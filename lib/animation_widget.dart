import 'package:flutter/material.dart';

class MyAnimatedWidget extends StatefulWidget {
  final String appBarTitle;

  MyAnimatedWidget({
    this.appBarTitle,
  });

  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animController;

  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);

    animation = Tween<double>(begin: 0, end: 16)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(animController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animController.forward();
            }
          });

    animController.forward(from: 0);
  }

  @override
  void dispose() {
    animController.dispose();
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
        child: Wrap(
          children: [
            CustomAnimatedWidget(
              animation: animation,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAnimatedWidget extends AnimatedWidget {
  CustomAnimatedWidget({
    Key key,
    @required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: animation.value + 30.0,
            right: 30.0 - animation.value,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            padding: EdgeInsets.all(64),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blue[900],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}
