import 'package:flutter/material.dart';
import 'package:macaw/widget_exp3.dart';

void main() {
  runApp(const SdbxApp());
}

class SdbxApp extends StatelessWidget {
  const SdbxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sdbx',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Exp3Widget());
  }
}
