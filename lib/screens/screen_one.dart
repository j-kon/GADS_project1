import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenOne extends StatefulWidget {
  static const String id = 'screen_one';
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Leader Board'),
          actions: [
            RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {},
              child: Text(
                'Submit',
                style: GoogleFonts.roboto(color: Colors.black),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Text('Learning Leaders'),
              Text('Skill IQ Leaders'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text('data'),
            Text('data'),
          ],
        ),
      ),
    );
  }
}
