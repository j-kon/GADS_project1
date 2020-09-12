import 'dart:convert';

import 'package:aad_practice_project/screens/screen_two.dart';
import 'package:aad_practice_project/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenOne extends StatefulWidget {
  static const String id = 'screen_one';
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  bool isLoading = false;
  List usersHoursList = [];
  List usersSkillList = [];

  Future getusers() async {
    setState(() {
      isLoading = true;
    });
    final usersHours = await RequestResources().getResources('api/hours');
    final usersSkill = await RequestResources().getResources('api/skilliq');
    var usersHoursBody = json.decode(usersHours.body);
    var usersSkillBody = json.decode(usersSkill.body);
    setState(() {
      usersHoursList = usersHoursBody;
      usersSkillList = usersSkillBody;
      isLoading = false;
    });
  }

  @override
  void initState() {
    getusers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'LEADERBOARD',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ButtonTheme(
                  height: 20,
                  minWidth: 100,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ScreenTwo.id);
                    },
                    child: Text(
                      'Submit',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            tabs: [
              Text('Learning Leaders'),
              Text('Skill IQ Leaders'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            !isLoading
                ? ListView.builder(
                    itemCount: usersHoursList.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          child: ListTile(
                            leading: Image.network(
                                usersHoursList[index]['badgeUrl']),
                            title: Text(usersHoursList[index]['name']),
                            subtitle: Text(
                                '${usersHoursList[index]['hours']} learnin hours, ${usersHoursList[index]['country']}'),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            !isLoading
                ? ListView.builder(
                    itemCount: usersSkillList.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          child: ListTile(
                            leading: Image.network(
                                usersSkillList[index]['badgeUrl']),
                            title: Text(usersSkillList[index]['name']),
                            subtitle: Text(
                                '${usersSkillList[index]['score']} skill IQ score, ${usersSkillList[index]['country']}'),
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
