import 'package:anny/animation_builder.dart';
import 'package:anny/animation_container.dart';
import 'package:anny/animation_cross_fade.dart';
import 'package:anny/animation_default_text_style.dart';
import 'package:anny/animation_icon.dart';
import 'package:anny/animation_list.dart';
import 'package:anny/animation_list_item.dart';
import 'package:anny/animation_opacity.dart';
import 'package:anny/animation_padding.dart';
import 'package:anny/animation_physical_model.dart';
import 'package:anny/animation_positioned.dart';
import 'package:anny/animation_switcher.dart';
import 'package:anny/animation_widget.dart';
import 'package:anny/decoration_box_transition.dart';
import 'package:anny/hero_animation.dart';
import 'package:anny/position_transition.dart';
import 'package:anny/scale_transition.dart';
import 'package:anny/size_transition.dart';
import 'package:anny/slide_transition.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Animation'.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(
              16,
            ),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyAnimationBuilder(
                          appBarTitle: 'Animation Builder',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Animation Builder',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyAnimationIcon(
                          appBarTitle: 'Animation Icon',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Animation Icon',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyAnimationSwitcher(
                          appBarTitle: 'Animation Switcher',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Animation Switcher',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyAnimatedPositioned(
                          appBarTitle: 'Animated Position',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Animated Position',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyAnimatedPadding(
                          appBarTitle: 'Animated Padding',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Animated Padding',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyAnimatedContainer(
                          appBarTitle: 'Animated Container',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Animated Container',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyAnimatedOpacity(
                          appBarTitle: 'Animated Opacity',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Animated Opacity',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyAnimatedCrossFade(
                          appBarTitle: 'Animated CrossFade',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Animated CrossFade',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyAnimatedWidget(
                          appBarTitle: 'Animated Widget',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Animated Widget',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyAnimatedDefaultTextStyle(
                          appBarTitle: 'Animated Default TextStyle',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Animated Default TextStyle',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyAnimatedList(
                          appBarTitle: 'Animated List',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Animated List',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyDecoratedBoxTransition(
                          appBarTitle: 'Decorated Box Transition',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Decorated Box Transition',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyHero(
                          appBarTitle: 'Hero Animation',
                        );
                      }),
                    );
                  },
                  child: Hero(
                    tag: Hero,
                    child: AnimationListItem(
                      title: 'Hero Animation',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyPositionedTransition(
                          appBarTitle: 'Position Transition',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Position Transition',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MySlideTransition(
                          appBarTitle: 'Slide Transition',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Slide Transition',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MySizeTransition(
                          appBarTitle: 'Size Transition',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Size Transition',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyScaleTransition(
                          appBarTitle: 'Scale Transition',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Scale Transition',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) {
                        return MyAnimationPhysicalModel(
                          appBarTitle: 'Physical Model Animation',
                        );
                      }),
                    );
                  },
                  child: AnimationListItem(
                    title: 'Physical Model Animation',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
