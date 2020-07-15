import 'package:big_two_calculator/main.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            mainNavigatorKey.currentState.pushNamed('game_stats');
          },
          child: Text("Start Screen"),
        ),
      ),
    );
  }
}
