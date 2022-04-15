import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viaje a Bariloche',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Viaje a Bariloche'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 2;
  int _secondsToTrip =
      DateTime(2022, 05, 23, 9, 50).difference(DateTime.now()).inSeconds;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _secondsToTrip--;
      });
      if (_secondsToTrip == 0) {
        timer.cancel();
      }
    });
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String twoDigitsFormat(number) {
    return number < 10 ? '0$number' : number.toString();
  }

  String formattedDate(date) {
    int seconds = date % 60;
    int minutes = (date ~/ 60) % 60;
    int hours = (date ~/ 3600) % 24;
    int days = (date ~/ 86400);
    return ' ${days}D\n$hours:${twoDigitsFormat(minutes)}:${twoDigitsFormat(seconds)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bari${_counter % 6}.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 270,
                width: 270,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  border: Border.all(
                    color: Colors.white60,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(135),
                  ),
                ),
                child: Center(
                  child: Text(
                    formattedDate(_secondsToTrip),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 64,
                      color: Color.fromARGB(240, 0, 75, 120),
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: _incrementCounter,
                child: const Text(
                  "CAMBIAR FONDO",
                  style: TextStyle(color: Colors.white38),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
