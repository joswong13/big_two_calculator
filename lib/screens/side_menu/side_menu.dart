import 'package:big_two_calculator/constants/side_menu_constants.dart';
import 'package:big_two_calculator/main.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> with SingleTickerProviderStateMixin<SideMenu> {
  AnimationController _animationController;
  bool isSideMenuOpened = false;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedPositioned(
      duration: _animationDuration,
      top: 0,
      bottom: 0,
      left: isSideMenuOpened ? 0 : -screenWidth,
      right: isSideMenuOpened ? 0 : screenWidth - 35,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.blue[300],
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  ...sideMenuNavPaths
                      .map(
                        (navPath) => ListTile(
                          onTap: () {
                            customNavigatorKey.currentState.pushReplacementNamed(navPath["path"]);
                            onMenuPress();
                          },
                          title: Text(
                            navPath["title"],
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      )
                      .toList()
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.9),
            child: GestureDetector(
              onTap: () {
                onMenuPress();
              },
              child: ClipPath(
                clipper: Clipper(),
                child: Container(
                  width: 35,
                  height: 110,
                  color: Colors.amber,
                  alignment: Alignment.centerLeft,
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _animationController.view,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.transparent;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
