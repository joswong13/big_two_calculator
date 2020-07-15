import 'package:big_two_calculator/main.dart';
import 'package:big_two_calculator/screens/add_user/add_user.dart';
import 'package:big_two_calculator/screens/side_menu/side_menu.dart';
import 'package:big_two_calculator/screens/start_screen/start_screen.dart';
import 'package:big_two_calculator/screens/view_users/view_users.dart';
import 'package:flutter/material.dart';

class HomePageOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[CustomNavigator(), SideMenu()],
        ),
      ),
    );
  }
}

class CustomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: customNavigatorKey,
      initialRoute: 'home/start_screen',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'home/start_screen':
            builder = (BuildContext _) => StartScreen();
            break;
          case 'home/add_user':
            builder = (BuildContext _) => AddUser();
            break;
          case 'home/view_user':
            builder = (BuildContext _) => ViewUsers();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
