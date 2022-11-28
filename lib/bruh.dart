import 'package:flutter/material.dart';

class Bruh extends StatefulWidget {
  const Bruh({Key? key}) : super(key: key);

  @override
  State<Bruh> createState() => _BruhState();
}

class _BruhState extends State<Bruh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: const Text("Bruh"))),
    );
  }
}
