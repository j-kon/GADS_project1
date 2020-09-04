import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'splash';
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
