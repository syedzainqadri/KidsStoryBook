
import 'package:flutter/material.dart';

const kFbColor = Color(0xff4e618f);
const kSplashColor = Colors.white;
const kSelectedText = Colors.black;
const kUnselectedText = Colors.grey;

// Tag Widget

class BookTag extends StatelessWidget {
  final bookName;
  final text;
  const BookTag({
    Key key,
    this.bookName,
    this.text,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return Container(
      color: Colors.blue,
      child: Text("Book"),
    );
  }
}


class PhilosophyTag extends StatelessWidget {
  final text;
  const PhilosophyTag({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Text("Philosophy"),
    );
  }
}
