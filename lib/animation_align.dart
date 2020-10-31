import 'package:flutter/material.dart';

class MyAnimationAlign extends StatefulWidget {
  final String appBarTitle;

  MyAnimationAlign({
    this.appBarTitle,
  });

  @override
  _MyAnimationAlignState createState() => _MyAnimationAlignState();
}

class _MyAnimationAlignState extends State<MyAnimationAlign> {
  AlignmentGeometry _alignment = Alignment.topRight;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _changeAlignment() {
    setState(() {
      _alignment = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
    });
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue[50],
              child: AnimatedAlign(
                alignment: _alignment,
                curve: Curves.ease,
                duration: Duration(seconds: 3),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                _changeAlignment();
              },
              child: Text(
                "Click Me!",
              ),
            )
          ],
        ),
      ),
    );
  }
}
