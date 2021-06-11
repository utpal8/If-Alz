import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../game_choose.dart';
import 'pattern1.dart';

bool userAnswered = false;
bool correctAnswer = false;
bool answer1 = false;
bool answer2 = false;
bool answer3 = false;
bool answer4 = false;

class CelebrityFifth extends StatefulWidget {
  final int simonLevel;
  final int celebrityPoints;
  final bool fromChooseGame;
  CelebrityFifth(
      {this.fromChooseGame = false,
        this.simonLevel = 0,
        this.celebrityPoints = 0});
  @override
  _CelebrityFifthState createState() => _CelebrityFifthState();
}

class _CelebrityFifthState extends State<CelebrityFifth> {
  handleAnswers(bool e, int ansnum) {
    userAnswered = true;
    if (ansnum == 1) {
      answer1 = true;
    }
    if (ansnum == 2) {
      answer2 = true;
    }
    if (ansnum == 3) {
      answer3 = true;
    }
    if (ansnum == 4) {
      answer4 = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    userAnswered = false;
    answer1 = false;
    answer2 = false;
    answer3 = false;
    answer4 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.height * 0.06,
            MediaQuery.of(context).size.height * 0.06,
            MediaQuery.of(context).size.height * 0.06,
            MediaQuery.of(context).size.height * 0.005),
        child: Column(
          children: <Widget>[
            Text(
              'Celebrity Quiz',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(fontSize: 30, fontFamily: 'Quicksand'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                image: DecorationImage(
                    image: AssetImage('images/Sachin.jpg'), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Q1. Which famous sportsperson is this?',
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontSize: 22, fontFamily: 'Quicksand'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.014),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (!userAnswered) {
                      handleAnswers(false, 1);
                    }
                  },
                  child: Card(
                    color: (answer1) ? Colors.red : Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      title: Text(
                        "1. Rahul Dravid",
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (!userAnswered) {
                      handleAnswers(false, 2);
                    }
                  },
                  child: Card(
                    color: (answer2) ? Colors.red : Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      title: Text(
                        "2. Anil Kumble",
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (!userAnswered) {
                      handleAnswers(true, 3);
                    }
                  },
                  child: Card(
                    color: (answer3) ? Colors.green : Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      title: Text(
                        "3. Sachin Tendulkar",
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (!userAnswered) {
                      handleAnswers(true, 4);
                    }
                  },
                  child: Card(
                    color: (answer4) ? Colors.red : Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      title: Text(
                        "4. Yuvraj Singh",
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.63,
                    ),
                    (userAnswered)
                        ? RawMaterialButton(
                      onPressed: () {
                        if (widget.fromChooseGame &&
                            widget.simonLevel == 0) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GameChoose()),
                                  (Route<dynamic> route) => false);
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Pattern(
                                simonLevel: widget.simonLevel,
                                celebrityPoints: (answer3)
                                    ? widget.celebrityPoints + 1
                                    : widget.celebrityPoints,
                              ),
                            ),
                          );
                        }
                      },
                      //RawMaterialButton widget class is used for building buttons from scratch
                      child: Icon(
                        FontAwesomeIcons.arrowRight,
                        color: Colors.white,
                      ), //Icon widget requires an either Icons.someicon or FontAwesomeIcons.someicon value
                      constraints:
                      BoxConstraints.tightFor(width: 56, height: 56),
                      shape: CircleBorder(),
                      fillColor: Color(0xFF4C4F5E),
                      elevation: 0.0,
                    )
                        : Text(''),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
