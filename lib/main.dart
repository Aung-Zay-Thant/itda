import 'package:flutter/material.dart';
import 'package:itda/components/dobtextfield.dart';
import 'package:itda/components/middlecontainer.dart';
import 'package:itda/components/nametextfield.dart';
import 'package:itda/components/topcontainers.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    ));

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void showError(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 5,
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Close',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
            title: Center(
                child: Text(
              'Warining!',
              style: TextStyle(color: Colors.red),
            )),
            content: Text('Please Fill All Fields.'),
          );
        });
  }

  void showInfo(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(member),
                  Text(gender),
                  Text(grade),
                  Text(name),
                  Text(DateFormat.yMd().format(dob)),
                  Center(
                    child: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage('images/submit.png'))),
                          child: Center(
                              child: Text('Close',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xfff1f1f6),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TopContainer(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Grade',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            MiddleContainer(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Name',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            Name(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 16.0),
              child: Text(
                'Date of Birth',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            DOB(),
            Center(
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: Color(0xfff1f1f6),
                        image: DecorationImage(
                            image: AssetImage('images/submit.png'))),
                    child: Center(
                        child: Text('Submit',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
                onTap: () {
                  if (member == null ||
                      gender == null ||
                      grade == null ||
                      name == null ||
                      dob == null) {
                    showError(context);
                  } else {
                    showInfo(context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
