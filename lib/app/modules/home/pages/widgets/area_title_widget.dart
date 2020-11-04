import 'package:flutter/material.dart';

class AreaTitleWidget extends StatelessWidget {
  AreaTitleWidget({
    Key key,
    @required this.title,
    this.alignment,
    this.textColor = Colors.white,
    this.paddingBottom = 0.0,
    this.paddingTop = 0.0,
  }) : super(key: key);

  final String title;
  final Alignment alignment;
  final Color textColor;
  final double paddingBottom;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: this.paddingTop, bottom: this.paddingBottom),
      alignment: this.alignment,
      child: Text(
        this.title,
        style: TextStyle(
          color: this.textColor,
          fontWeight: FontWeight.w300,
          fontSize: 44.0,
        ),
      ),
    );
  }
}
