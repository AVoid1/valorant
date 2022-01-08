import 'package:flutter/material.dart';
import 'dart:math';

import 'package:shake/shake.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: const Center(
            child: Text(
              'Valorat Randomizer',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: ValorantRandomizer(),
      ),
    ),
  );
}

class ValorantRandomizer extends StatefulWidget {
  const ValorantRandomizer({Key? key}) : super(key: key);

  @override
  _ValorantRandomizerState createState() => _ValorantRandomizerState();
}

class _ValorantRandomizerState extends State<ValorantRandomizer> {
  get child => null;

  int valorantAgent = 4;
  void agentRandomizer() {
    setState(() {
      valorantAgent = Random().nextInt(12) + 1;
    });
  }

  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
      onPhoneShake: () {
        agentRandomizer();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                agentRandomizer();
              },
              child: Image.asset(
                'images/undefined$valorantAgent.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
