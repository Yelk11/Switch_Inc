import 'package:flutter/material.dart';

class MyLever extends StatefulWidget {
  final int counter;
  final bool isEnabled;
  final VoidCallback callback;
  const MyLever(
      {Key? key,
      required this.counter,
      required this.isEnabled,
      required this.callback})
      : super(key: key);

  @override
  State<MyLever> createState() => _MyLeverState(counter, isEnabled, callback);
}

class _MyLeverState extends State<MyLever> {
  bool _isEnabled;
  int _counter;
  final VoidCallback _callback;
  _MyLeverState(this._counter, this._isEnabled, this._callback);

  @override
  Widget build(BuildContext context) {
    _isEnabled = widget.isEnabled;
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("$_counter"),
          const Text("Level"),
          ElevatedButton(
            onPressed: () => _isEnabled ? {
              _callback(),
              print("ll")
              } : null,
            child: const Text('Switch'),
          ),
        ],
      ),
    );
  }
}
