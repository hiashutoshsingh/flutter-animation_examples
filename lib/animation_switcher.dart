import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimationSwitcher extends StatefulWidget {
  final String appBarTitle;

  MyAnimationSwitcher({
    this.appBarTitle,
  });

  @override
  _MyAnimationSwitcherState createState() => _MyAnimationSwitcherState();
}

class _MyAnimationSwitcherState extends State<MyAnimationSwitcher>
    with TickerProviderStateMixin {
  int _counter = 0;

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
      body: GestureDetector(
        onTap: () => setState(() => _counter++),
        child: Container(
          color: Colors.white,
          child: Center(
            child: Wrap(
              children: [
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: getWidget(),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    /// default is FadeTransition
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        // below is the percentage given to a widget 0.0 - 1.0
                        scale: Tween<double>(begin: .6, end: .8)
                            .animate(animation),
                        child: child,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// different widgets according to counter value which is unique for every key
  Widget getWidget() {
    if (_counter == 0) {
      return Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          key: ValueKey<int>(_counter),
          padding: EdgeInsets.all(64),
          decoration: BoxDecoration(
            color: Color.fromRGBO(
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextInt(256),
              1,
            ),
          ),
        ),
      );
    } else if (_counter == 1) {
      return Container(
        key: ValueKey<int>(_counter),
        padding: EdgeInsets.all(64),
        decoration: BoxDecoration(
          color: Color.fromRGBO(
            Random().nextInt(256),
            Random().nextInt(256),
            Random().nextInt(256),
            1,
          ),
          shape: BoxShape.circle,
        ),
      );
    } else if (_counter == 2) {
      return Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          key: ValueKey<int>(_counter),
          padding: EdgeInsets.all(64),
          decoration: BoxDecoration(
            color: Color.fromRGBO(
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextInt(256),
              1,
            ),
            shape: BoxShape.rectangle,
          ),
        ),
      );
    } else if (_counter == 3) {
      return Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          key: ValueKey<int>(_counter),
          padding: EdgeInsets.all(56),
          decoration: BoxDecoration(
            color: Color.fromRGBO(
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextInt(256),
              1,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'YOU ARE NOW DONE WITH ALL WIDGETS',
        textAlign: TextAlign.center,
        style: TextStyle(
          letterSpacing: 1,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue[900],
        ),
      ),
    );
  }
}
