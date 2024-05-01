import 'dart:async';

import 'package:corona_app_api/View/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this)..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    Timer(const Duration(seconds: 5), 
    () => Navigator.push(context, MaterialPageRoute(builder: (context) => WorldStates())));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: AnimatedBuilder(
                animation: _controller, 
                child: Container(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Image(image: AssetImage('images/virus.png'))),
                ),
                builder: (BuildContext context, Widget? child)
                {
                  return Transform.rotate(
                    angle: _controller.value *2.0 * math.pi,
                    child: child,);
                }),
            ),
              const Align(
              alignment: Alignment.center,
              child: Text('Covid19\nTracker App', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)
              )
          ],
        ),
      ),
    );
  }
}
