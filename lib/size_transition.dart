import 'package:flutter/material.dart';

class MySizeTransition extends StatefulWidget {
  final String appBarTitle;

  const MySizeTransition({Key key, this.appBarTitle}) : super(key: key);
  @override
  _MySizeTransitionState createState() => _MySizeTransitionState();
}

class _MySizeTransitionState extends State<MySizeTransition> with SingleTickerProviderStateMixin {
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
    super.dispose();

    /// disposes the animation controller
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.appBarTitle.toUpperCase()),
      ),
      body: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.vertical,
        axisAlignment: -1,
        child: Center(
          child: FlutterLogo(size: 150),
        ),
      ),
    );
  }
}
