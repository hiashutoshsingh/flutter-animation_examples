import 'package:flutter/material.dart';

class MyAnimationPhysicalModel extends StatefulWidget {
  final String appBarTitle;

  MyAnimationPhysicalModel({
    this.appBarTitle,
  });

  @override
  _MyAnimationPhysicalModelState createState() =>
      _MyAnimationPhysicalModelState();
}

class _MyAnimationPhysicalModelState extends State<MyAnimationPhysicalModel> {
  bool _first = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPhysicalModel(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              elevation: _first ? 0 : 6.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.white,
              borderRadius: _first
                  ? const BorderRadius.all(Radius.circular(0))
                  : const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: const Text('Click Me!'),
              onPressed: () {
                setState(() {
                  _first = !_first;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
