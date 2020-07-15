import 'package:big_two_calculator/screens/game_stats/end_game/end_game.dart';
import 'package:big_two_calculator/screens/game_stats/player_stats/player_stats.dart';
import 'package:big_two_calculator/screens/game_stats/players/players.dart';
import 'package:big_two_calculator/screens/game_stats/round_data/round_data.dart';
import 'package:flutter/material.dart';

class GameStats extends StatefulWidget {
  @override
  _GameStatsState createState() => _GameStatsState();
}

class _GameStatsState extends State<GameStats> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: <Widget>[Players(), RoundData(), PlayerStats(), EndGame()]),
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        child: Material(
          color: Colors.black,
          child: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Players",
                icon: Icon(Icons.calendar_today),
              ),
              Tab(
                text: "Rounds",
                icon: Icon(Icons.category),
              ),
              Tab(
                text: "Stats",
                icon: Icon(Icons.insert_chart),
              ),
              Tab(
                text: "End",
                icon: Icon(Icons.settings),
              ),
            ],
            controller: _tabController,
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey[800],
          ),
        ),
      ),
    );
  }
}
