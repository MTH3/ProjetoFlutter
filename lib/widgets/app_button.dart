import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;

  Function onPressed;

  AppButton(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RaisedButton(
        color: Colors.deepPurpleAccent,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
