import 'dart:convert';

import 'package:aad_practice_project/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenOne extends StatefulWidget {
  static const String id = 'screen_one';
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  List users = [];

  Future getUsers() async {
    print('Fetching...');
    final res = await RequestResources().getResources('api/hours');
    var body = json.decode(res.body);
    setState(() {
      users = body;
    });
    // return Users.fromJson(json.decode(res.body[0]));
    // print(body);
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

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
            ListView.builder(
              itemCount: users.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      leading: Image.network(users[index]['badgeUrl']),
                      title: Text(users[index]['name']),
                      subtitle: Text(
                          '${users[index]['hours']} learnin hours, ${users[index]['country']}'),
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Text('$index');
              },
            ),
          ],
        ),
      ),
    );
  }
}
