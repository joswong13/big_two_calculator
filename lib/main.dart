import 'package:big_two_calculator/screens/game_stats/game_stats.dart';
import 'package:big_two_calculator/screens/home_page_overlay/home_page_overlay.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> customNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WillPopScope(
          onWillPop: () {
            return Future(() => false);
          },
          child: MainNavigator()),
    );
  }
}

class MainNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: mainNavigatorKey,
      initialRoute: 'home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'home':
            builder = (BuildContext _) => HomePageOverlay();
            break;
          case 'game_stats':
            builder = (BuildContext _) => GameStats();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
