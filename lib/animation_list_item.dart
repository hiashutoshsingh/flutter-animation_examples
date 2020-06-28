import 'package:flutter/material.dart';

class AnimationListItem extends StatelessWidget {
  final String title;

  AnimationListItem({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(
            16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.blue,
                  letterSpacing: 0.5,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            border: Border.all(
              color: Colors.blue[700],
              width: 3,
            ),
          ),
        ),
        SizedBox(
          height: 24,
        )
      ],
    );
  }
}
