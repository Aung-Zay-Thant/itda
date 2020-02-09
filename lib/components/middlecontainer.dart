import 'package:flutter/material.dart';

enum Grade { second, third, fourth, fifth, sixth }
const activeColor = Color(0xff356fbb);
const inactiveColor = Colors.white;
String grade;

class MiddleContainer extends StatefulWidget {
  @override
  _MiddleContainerState createState() => _MiddleContainerState();
}

class _MiddleContainerState extends State<MiddleContainer> {
  Grade selectedGrade;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      color: Color(0xfff1f1f6),
      child: Row(
        children: <Widget>[
          Cards(
            boxname: '2nd Grade',
            colour:
                (selectedGrade == Grade.second ? activeColor : inactiveColor),
            onPress: () {
              setState(() {
                selectedGrade = Grade.second;
              });
              grade = '2nd Grade';
            },
          ),
          Cards(
            boxname: '3rd Grade',
            colour:
                (selectedGrade == Grade.third ? activeColor : inactiveColor),
            onPress: () {
              setState(() {
                selectedGrade = Grade.third;
              });
              grade = '3rd Grade';
            },
          ),
          Cards(
            boxname: '4th Grade',
            colour:
                (selectedGrade == Grade.fourth ? activeColor : inactiveColor),
            onPress: () {
              setState(() {
                selectedGrade = Grade.fourth;
              });
              grade = '4th Grade';
            },
          ),
          Cards(
            boxname: '5th Grade',
            colour:
                (selectedGrade == Grade.fifth ? activeColor : inactiveColor),
            onPress: () {
              setState(() {
                selectedGrade = Grade.fifth;
              });
              grade = '5th Grade';
            },
          ),
          Cards(
            boxname: '6th Grade',
            colour:
                (selectedGrade == Grade.sixth ? activeColor : inactiveColor),
            onPress: () {
              setState(() {
                selectedGrade = Grade.sixth;
              });
              grade = '6th Grade';
            },
          )
        ],
      ),
    );
  }
}


// Can Change the Style Of Card Here
class Cards extends StatelessWidget {
  Cards({this.onPress, this.colour, this.boxname});

  final String boxname;
  final Function onPress;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                color: Colors.white,
                border: Border.all(width: 5, color: colour),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ]),
          ),
          onTap: onPress),
    ));
  }
}
