import 'package:flutter/material.dart';

enum Member { student, team }
const activeColor = Color(0xff356fbb);
const inactiveColor = Colors.white;
String member;
String gender;

enum Gender { male, female }

class TopContainer extends StatefulWidget {
  @override
  _TopContainerState createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  Member selectedMember;
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.18,
      color: Color(0xfff3f3f3),
      child: Row(
        children: <Widget>[

          // Right Two Boxs
          Expanded(
              child: Container(
            color: Color(0xfff3f3f3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Member',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(children: <Widget>[
                  ReusableCard(
                    boxname: 'I\'m a student',
                    colour: (selectedMember == Member.student
                        ? activeColor
                        : inactiveColor),
                    onPress: () {
                      setState(() {
                        selectedMember = Member.student;
                      });
                      member = 'I\'m astudent';
                    },
                  ),
                  ReusableCard(
                    boxname: 'We\'re a team',
                    colour: (selectedMember == Member.team
                        ? activeColor
                        : inactiveColor),
                    onPress: () {
                      setState(() {
                        selectedMember = Member.team;
                      });
                      member = 'We\'re a team';
                    },
                  )
                ])
              ],
            ),
          )),
          SizedBox(
            width: 20,
          ),

          // Left Two Boxs
          Expanded(
              child: Container(
            color: Color(0xfff3f3f3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Gender',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(children: <Widget>[
                  ReusableCard(
                    boxname: 'Boy',
                    colour: (selectedGender == Gender.male
                        ? activeColor
                        : inactiveColor),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                      gender = 'Boy';
                    },
                  ),
                  ReusableCard(
                    boxname: 'Girl',
                    colour: (selectedGender == Gender.female
                        ? activeColor
                        : inactiveColor),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                      gender = 'Girl';
                    },
                  )
                ])
              ],
            ),
          )),
        ],
      ),
    );
  }
}

// Can Change Here
class ReusableCard extends StatelessWidget {
  final String boxname;
  final Function onPress;
  final Color colour;

  ReusableCard({this.boxname, this.onPress, this.colour});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 16, left: 16.0, right: 16.0),
      child: GestureDetector(
          child: Container(
            height: 80,
            child: Center(
              child: Text(
                boxname,
                textAlign: TextAlign.center,
              ),
            ),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ],
                color: Colors.white,
                border: Border.all(width: 5, color: colour),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          onTap: onPress),
    ));
  }
}
