import 'dart:convert';

import 'package:aad_practice_project/services/api.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ScreenTwo extends StatefulWidget {
  static const String id = 'screen_two';
  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  bool isSubmitting = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController githubLinkController = TextEditingController();

  _clearForm() {
    firstNameController.clear();
    lastNameController.clear();
    emailAddressController.clear();
    githubLinkController.clear();
  }

  doSubmit() async {
    setState(() {
      isSubmitting = true;
    });
    var data = {
      'entry.1877115667': firstNameController.text,
      'entry.2006916086': lastNameController.text,
      'entry.1824927963': emailAddressController.text,
      'entry.284483984': githubLinkController.text,
    };
    var res = await RequestResources().postSubmitData(data,
        '1FAIpQLSf9d1TcNU6zc6KR8bSEM41Z1g1zl35cwZr2xyjIhaMAz8WChQ/formResponse');
    int statusCode = res.statusCode;
    if (statusCode == 200) {
      print('Success');
      _clearForm();
      setState(() {
        isSubmitting = false;
      });
      Alert(
        context: context,
        title: 'Submission Successful',
        type: AlertType.success,
      ).show();
    } else {
      print(statusCode);
      setState(() {
        isSubmitting = false;
      });
      Alert(
        context: context,
        title: 'Submission not Successful',
        type: AlertType.error,
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: isSubmitting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100.0),
                    Center(
                      child: Text(
                        'Project Submission',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextField(
                            controller: firstNameController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(),
                              labelText: 'First Name',
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: TextField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(),
                              labelText: 'Last Name',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: [
                        TextField(
                          controller: emailAddressController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                            labelText: 'Email Address',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      children: [
                        TextField(
                          controller: githubLinkController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                            labelText: 'Project on GITHUB (link)',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 48,
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Color.fromRGBO(44, 138, 248, 1),
                        elevation: 0.0,
                        onPressed: () {
                          Alert(
                            context: context,
                            title: 'Are you sure? ',
                            buttons: [
                              DialogButton(
                                width: 100,
                                child: Container(
                                  height: 35,
                                  width: 290,
                                  color: Colors.white,
                                  child: Text(
                                    "Yes",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  doSubmit();
                                  Navigator.pop(context);
                                },
                                color: Colors.orange,
                              )
                            ],
                          ).show();
                        },
                        child: Text('Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
