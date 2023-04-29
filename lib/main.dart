import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:macaw/camera_app.dart';
import 'package:macaw/widget_exp3.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(const CameraApp());
  // runApp(const SdbxApp());
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

class _MyWidgetState extends State<MyWidget> with SingleTickerProviderStateMixin {
  late final AnimationController ctrl;
  bool running = true;
  @override
  void initState() {
    ctrl = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void didUpdateWidget(MyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    ctrl.duration = Duration(seconds: 2);
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blockColor = const HSLColor.fromAHSL(1.0, 200.5479, .6918, .4092);
    return Scaffold(
      body: Container(
        color: Colors.white24,
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Positioned(
            //   bottom: 8,
            //   left: 8,
            //   right: 8,
            //   child: Row(
            //     children: [
            //       ElevatedButton(
            //           onPressed: () {
            //             running ? ctrl.stop() : ctrl.forward();
            //             running = !running;
            //           },
            //           child: Text(running ? 'stop' : 'go')),
            //       Spacer(),
            //       ElevatedButton(
            //           onPressed: () {
            //             ctrl.reset();
            //           },
            //           child: const Text('restart')),
            //     ],
            //   ),
            // ),
            Positioned(
              top: 300,
              child: Container(
                color: blockColor.toColor(),
                width: 50,
                height: 50,
              )
                  .animate(controller: ctrl)
                  .fadeIn(curve: Curves.slowMiddle)
                  .moveX(begin: -20, end: 400, duration: 3.seconds, curve: Curves.linear),
            ),
          ],
        ),
      ),
    );
  }
}
