import 'package:flutter/material.dart';

class EndGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("End Game"),
        ),
      ),
    );
  }
}
