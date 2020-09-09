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
  bool loadingHours = false;
  bool loadingSkill = false;
  List usersHours = [];
  List usersSkill = [];

  Future getusersHours() async {
    setState(() {
      loadingHours = true;
    });
    final res = await RequestResources().getResources('api/hours');
    var body = json.decode(res.body);
    setState(() {
      usersHours = body;
      loadingHours = false;
    });
  }

  Future getusersSkill() async {
    setState(() {
      loadingSkill = true;
    });
    final res = await RequestResources().getResources('api/skilliq');
    var body = json.decode(res.body);
    setState(() {
      usersSkill = body;
      loadingSkill = false;
    });
  }

  @override
  void initState() {
    getusersHours();
    getusersSkill();
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
            !loadingHours
                ? ListView.builder(
                    itemCount: usersHours.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          child: ListTile(
                            leading:
                                Image.network(usersHours[index]['badgeUrl']),
                            title: Text(usersHours[index]['name']),
                            subtitle: Text(
                                '${usersHours[index]['hours']} learnin hours, ${usersHours[index]['country']}'),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            !loadingHours
                ? ListView.builder(
                    itemCount: usersSkill.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          child: ListTile(
                            leading:
                                Image.network(usersSkill[index]['badgeUrl']),
                            title: Text(usersSkill[index]['name']),
                            subtitle: Text(
                                '${usersSkill[index]['score']} skill IQ score, ${usersSkill[index]['country']}'),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
    );
  }
}
