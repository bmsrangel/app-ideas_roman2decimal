import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ConvertButtonWidget extends StatelessWidget {
  const ConvertButtonWidget({
    Key key,
    @required this.color,
    this.onPressed,
  }) : super(key: key);

  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: this.color,
            width: 10.0,
          ),
        ),
        child: GestureDetector(
          onTap: this.onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Feather.arrow_up,
              color: this.color,
              size: 70.0,
            ),
          ),
        ),
      ),
    );
  }
}
