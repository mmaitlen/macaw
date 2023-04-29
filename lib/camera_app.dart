import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:macaw/main.dart';

/// CameraApp is the Main Application.
class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;
  bool hexyVisible = false;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });

    // controller.value
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            CameraPreview(controller),
            const Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Animation1(),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HexyWidget extends StatelessWidget {
  const HexyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 4,
      child: ClipPath(
        clipper: HexagonClipper(),
        child: Container(
          width: 72,
          height: 82,
          color: const Color.fromARGB(100, 200, 100, 100),
        ),
      ),
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path
      ..moveTo(size.width / 2, 0) // moving to topCenter 1st, then draw the path
      ..lineTo(size.width, size.height * .25)
      ..lineTo(size.width, size.height * .75)
      ..lineTo(size.width * .5, size.height)
      ..lineTo(0, size.height * .75)
      ..lineTo(0, size.height * .25)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}


class Animation1 extends StatefulWidget {
  const Animation1({super.key});

  @override
  State<Animation1> createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  bool stopped = false;
  Color color1 = const HSLColor.fromAHSL(1.0, 354, .71, .61).toColor();
  Color color2 = const HSLColor.fromAHSL(1.0, 143, 0.44, 0.44).toColor();
  Color color3 = const HSLColor.fromAHSL(1.0, 201, 0.69, 0.41).toColor();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        Container(
          height: 40,
          width: 40,
          color: color1,
        )
            .animate(controller: animationController)
            .then(
              delay: const Duration(milliseconds: 500),
            )
            .move(
                begin: const Offset(0, 400),
                end: const Offset(20, 400),
                duration: const Duration(milliseconds: 700))
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 700),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 700),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 700),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 700),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 700),
            )
            .then(delay: const Duration(milliseconds: 1000))
            //  GREEN
            .tint(color: color2, duration: const Duration(milliseconds: 10))
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 600),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 600),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 600),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 600),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 600),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 600),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 600),
            )
            .then(delay: const Duration(milliseconds: 1000))
            // BLUE
            .tint(color: color3, duration: const Duration(milliseconds: 10))
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 575),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 575),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 575),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 575),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 575),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 575),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 575),
            )
            .then(delay: const Duration(milliseconds: 1000))
            .move(
              end: Offset(20, 0),
              duration: Duration(milliseconds: 575),
            )
            .then(delay: const Duration(milliseconds: 1000)),
        Positioned(
            bottom: 0,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (stopped) {
                      animationController.forward();
                    } else {
                      animationController.stop();
                    }
                    stopped = !stopped;
                  },
                  child: const Text("pause"),
                ),
                ElevatedButton(
                  onPressed: () {
                    animationController.repeat();
                  },
                  child: const Text("restart"),
                ),
              ],
            )),
        Positioned(
          left: 0,
          right: 0,
          top: 400,
          child: Container(
            height: 3,
            color: Colors.black45,
          ),
        ),
        Positioned(
          left: 155,
          top: 400,
          child: Container(
            height: 20,
            width: 5,
            color: color2,
          ),
        ),
        Positioned(
          left: 295,
          top: 400,
          child: Container(
            height: 20,
            width: 5,
            color: color3,
          ),
        )
      ],
    );
    // .custom(
    //     duration: 300.ms,
    //     builder: (context, value, child) {
    //       final color = Color.lerp(Colors.amber, Colors.blue, value);
    //       if (color != null) {
    //         blockColor = color;
    //       }
    //       return child;
    //     }),
  }
}

class Animation2 extends StatefulWidget {
  const Animation2({super.key});

  @override
  State<Animation2> createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  bool stopped = false;
  Color blockColor = const HSLColor.fromAHSL(1.0, 28.855, .7067, .6147).toColor();
  Color finalColor = const HSLColor.fromAHSL(1.0, 351.8919, 0.5032, 0.4616).toColor();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: 40,
          color: blockColor,
        )
            .animate(controller: animationController)
            .then(
              delay: Duration(milliseconds: 100),
            )
            .move(
                begin: Offset(0, 170),
                end: Offset(300, 170),
                duration: Duration(seconds: 2))
            .then(
              delay: Duration(milliseconds: 250),
            )
            .move(
              end: Offset(-200, 200),
              duration: Duration(seconds: 2),
            )
            .then(
              delay: Duration(milliseconds: 250),
            )
            .move(
              end: Offset(100, 0),
              duration: Duration(seconds: 1),
            )
            .then(
                // delay: Duration(milliseconds: 250),
                )
            .tint(
              color: finalColor,
            )
            .then(
              delay: Duration(milliseconds: 250),
            )
            .move(
              end: Offset(300, 0),
              duration: Duration(seconds: 1),
            ),
        Positioned(
            bottom: 0,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (stopped) {
                      animationController.forward();
                    } else {
                      animationController.stop();
                    }
                    stopped = !stopped;
                  },
                  child: const Text("pause"),
                ),
              ],
            ))
      ],
    );
  }
}
