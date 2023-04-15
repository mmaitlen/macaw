import 'package:flutter/material.dart';

class Exp3Widget extends StatefulWidget {
  const Exp3Widget({super.key});

  @override
  State<Exp3Widget> createState() => _Exp3WidgetState();
}

class _Exp3WidgetState extends State<Exp3Widget> with SingleTickerProviderStateMixin {
  bool move = false;
  final blockColor = const HSLColor.fromAHSL(1.0, 28.855, .7067, .6147);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.loose,
        children: <Widget>[
          AnimatedPositioned(
            top: 250,
            left: !move ? 0 : 300,
            duration: const Duration(seconds: 2),
            // curve: Curves.fastOutSlowIn,
            child: AnimatedContainer(
              width: 50,
              height: 50,
              color: blockColor.toColor(),
              duration: const Duration(seconds: 3),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() => move = true),
                    child: const Text("go"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      move = false;
                    }),
                    child: const Text("reset"),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
