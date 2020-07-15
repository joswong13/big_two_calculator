import 'package:big_two_calculator/models/user_stats.dart';
import 'package:flutter/material.dart';

class BottomSheet extends StatefulWidget {
  String page;
  UserStats data;
  BottomSheet({Key key, @required this.page, this.data}) : super(key: key);

  @override
  _BottomSheetState createState() => _BottomSheetState(page, data);
}

class _BottomSheetState extends State<BottomSheet> {
  String page;
  UserStats data;
  _BottomSheetState(this.page, this.data);

  Widget userStatOrRoundStat(String page) {
    if (page == "user") {
      return Container(
        child: Text("USER"),
      );
    } else {
      return Container(
        child: Text("ROUNDS"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: userStatOrRoundStat(page),
    );
  }
}
