import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:music_player/music_player.dart';
import 'package:dezzer_app/screens/overview.dart';
import 'package:dezzer_app/screens/moods.dart';
import 'package:dezzer_app/screens/podcasts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MusicPlayer musicPlayer = MusicPlayer();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: GradientAppBar(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple[500],
              Colors.black,
            ],
          ),
          title: Text("Home"),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            indicatorColor: Colors.blueAccent,
            isScrollable: true,
            tabs: [
              Tab(text: "OverView"),
              Text(
                "Generes & Moods",
                textAlign: TextAlign.center,
              ),
              Tab(text: "PODCASTS"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OverView(),
            Moods(),
            PodCasts(),
          ],
        ),
      ),
    );
  }
}
