import 'package:aad_practice_project/screens/screen_one.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> _splash() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    return true;
  }

  @override
  void initState() {
    super.initState();
    _splash().then((status) {
      if (status) {
        Navigator.pushReplacementNamed(context, ScreenOne.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Center(
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70.0),
                    image: DecorationImage(
                      image: AssetImage('images/splash.png'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
