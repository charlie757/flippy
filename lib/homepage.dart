import 'dart:async';

import 'package:flippy/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initalHeight = birdYaxis;
  bool gameHasStarted = false;
  void jump() {
    setState(() {
      time = 0;
      initalHeight = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = initalHeight - height;
      });
      if (birdYaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  if (gameHasStarted) {
                    jump();
                  } else {
                    startGame();
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 0),
                  color: Colors.blue,
                  alignment: Alignment(0, birdYaxis),
                  child: const MyBird(),
                ),
              )),
          Expanded(
              child: Container(
            color: Colors.brown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('SCORE'), Text('0')],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('BEST'), Text('10')],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
