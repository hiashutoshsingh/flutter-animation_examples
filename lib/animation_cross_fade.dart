import 'package:flutter/material.dart';

class MyAnimatedCrossFade extends StatefulWidget {
  final String appBarTitle;

  MyAnimatedCrossFade({
    this.appBarTitle,
  });

  @override
  _MyAnimatedCrossFadeState createState() => _MyAnimatedCrossFadeState();
}

class _MyAnimatedCrossFadeState extends State<MyAnimatedCrossFade> {
  bool selected = false;

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
        child: AnimatedCrossFade(
          crossFadeState:
              selected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 2000),
          firstCurve: Curves.easeOut,
          secondCurve: Curves.easeIn,
          sizeCurve: Curves.bounceOut,
          firstChild: InkWell(
            splashColor: Colors.transparent,
            onTap: selected
                ? null
                : () {
                    setState(() {
                      selected = !selected;
                    });
                  },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                  border: Border.all(
                    color: Colors.blue[700],
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        size: 24,
                        color: Colors.blue[900],
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Text(
                        'Add to cart',
                        style: TextStyle(
                          color: Colors.blue,
                          letterSpacing: 0.5,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          secondChild: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
                border: Border.all(
                  color: Colors.blue[700],
                  width: 1,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.done,
                      size: 24,
                      color: Colors.blue[900],
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      'Checkout to cart',
                      style: TextStyle(
                        color: Colors.blue,
                        letterSpacing: 0.5,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
