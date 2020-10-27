import 'package:anny/animation_list_item.dart';
import 'package:flutter/material.dart';

class MyHero extends StatefulWidget {
  final String appBarTitle;

  MyHero({
    this.appBarTitle,
  });

  @override
  _MyHeroState createState() => _MyHeroState();
}

class _MyHeroState extends State<MyHero> with SingleTickerProviderStateMixin {
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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: Hero,
          child: AnimationListItem(
            title: 'Hero Animation',
          ),
        ),
      ),
    );
  }
}
