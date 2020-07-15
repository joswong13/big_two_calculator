import 'package:big_two_calculator/models/user.dart';
import 'package:big_two_calculator/models/user_stats.dart';
import 'package:big_two_calculator/view_models/users_vm.dart';
import 'package:big_two_calculator/widgets/shared_spinner.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewUsers extends StatefulWidget {
  @override
  _ViewUsersState createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> with SingleTickerProviderStateMixin<ViewUsers> {
  UsersVM usersViewModel = UsersVM();
  List<User> users = [];
  bool _isLoading = true;
  AnimationController _animationController;
  bool isSideMenuOpened = false;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _getAllUsers();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onMenuPress() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      setState(() {
        isSideMenuOpened = false;
      });
      _animationController.reverse();
    } else {
      setState(() {
        isSideMenuOpened = true;
      });
      _animationController.forward();
    }
  }

  void _getAllUsers() {
    usersViewModel.getAll().then((listOfUsers) {
      setState(() {
        users = listOfUsers;
        _isLoading = false;
      });
    });
  }

  String _convertDate(int millisecondsSinceEpoch) {
    var date = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    return DateFormat.yMd().format(date);
  }

  String _lastPlayed(int millisecondsSinceEpoch) {
    if (millisecondsSinceEpoch == 0) {
      return 'Never';
    } else {
      return _convertDate(millisecondsSinceEpoch);
    }
  }

  List<ListTile> renderUsersListTile(List<User> users) {
    if (users.length == 0) {
      return [
        ListTile(
          title: Text("No Users"),
        )
      ];
    } else {
      return users
          .map(
            (user) => ListTile(
              title: Text(user.name),
              onTap: () async {
                UsersVM usersViewModel = UsersVM();
                UserStats stats = await usersViewModel.getUserStats(user.id);

                print(stats.toMap());
              },
              subtitle: Column(
                children: <Widget>[
                  Text(_convertDate(user.dateAdded)),
                  Text(_lastPlayed(user.lastPlayed)),
                ],
              ),
            ),
          )
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        child: _isLoading
            ? sharedSpinner(150.0, 150.0)
            : Column(
                children: <Widget>[...renderUsersListTile(users)],
              ),
      ),
      AnimatedPositioned(
        duration: _animationDuration,
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          child: Text("User"),
        ),
      )
    ]);
  }
}
