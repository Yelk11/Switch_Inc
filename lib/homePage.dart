import 'package:flutter/material.dart';
import 'package:switch_inc/lever.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

enum activeLevel {
  LEVEL_ONE,
  LEVEL_TWO,
  LEVEL_THREE,
}

class _HomePageState extends State<HomePage> {
  double counter = 0;
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  int lever_one_counter = 0;
  int lever_two_counter = 0;
  int lever_three_counter = 0;

  bool _lever_one_enabled = false;
  bool lever_two_enabled = true;
  bool lever_three_enabled = false;
  activeLevel currentLevel = activeLevel.LEVEL_ONE;

  void leverOneCounter() {
    if (_lever_one_enabled) {
      setState(() {
        lever_one_counter++;
      });
    }
  }

  void leverTwoCounter() {
    if (lever_two_enabled) {
      setState(() {
        lever_two_counter++;
      });
    }
  }

  void leverThreeCounter() {
    if (lever_three_enabled) {
      setState(() {
        lever_three_counter++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    initState(){
      bool _lever_one_enabled = false;
      bool lever_two_enabled = true;
      bool lever_three_enabled = false;
    }
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Text("$counter"),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyLever(
                  counter: lever_one_counter,
                  isEnabled: _lever_one_enabled,
                  callback: () => {
                    setState(
                      () {
                        print("lever one");
                        currentLevel = activeLevel.LEVEL_ONE;
                        _lever_one_enabled = false;
                        lever_two_enabled = true;
                        lever_three_enabled = true;
                      },
                    ),
                  },
                ),
                MyLever(
                  counter: lever_two_counter,
                  isEnabled: _lever_one_enabled,
                  callback: () => {
                    setState(
                      () {
                        print("lever two");
                        currentLevel = activeLevel.LEVEL_TWO;
                        _lever_one_enabled = true;
                        lever_two_enabled = false;
                        lever_three_enabled = true;
                      },
                    ),
                  },
                ),
                MyLever(
                  counter: lever_three_counter,
                  isEnabled: lever_three_enabled,
                  callback: () => {
                    setState(
                      () {
                        print("lever three");
                        currentLevel = activeLevel.LEVEL_THREE;
                        _lever_one_enabled = true;
                        lever_two_enabled = true;
                        lever_three_enabled = false;
                      },
                    ),
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.grey,
            child: Center(
              child: Stack(
                children: [
                  // https://docs.flutter.dev/release/breaking-changes/buttons
                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: incrementCounter,
                    child: Text('Press ME!'),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
