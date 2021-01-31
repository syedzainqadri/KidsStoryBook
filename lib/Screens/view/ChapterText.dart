import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:simple_html_css/simple_html_css.dart';

class ChapterText extends StatefulWidget {
  const ChapterText({
    Key key,
    @required this.chapter,
  }) : super(key: key);

  final DocumentSnapshot chapter;

  @override
  _ChapterTextState createState() => _ChapterTextState();
}

class _ChapterTextState extends State<ChapterText> {
  bool _visible = false;
  final db = FirebaseFirestore.instance;
  double _value = 2;
  @override
  Widget build(BuildContext context) {
    var htmlContent = widget.chapter.get('chapterText');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_drop_down),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/Aa.png'),
            onPressed: () {
              setState(() {});
              _visible = !_visible;
            },
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: Image.asset('assets/dotmenu.png'),
            onPressed: () {
              Get.back();
            },
          ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              Share.share(
                  'Check out kidsstorybook https://www.kidsstorybook.com',
                  subject: 'Ustadian Book Reading App');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: _visible,
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 10)
                    ]),
                child: Slider(
                  value: _value,
                  activeColor: Colors.black,
                  inactiveColor: Colors.black,
                  onChanged: (double s) {
                    setState(() {
                      _value = s;
                    });
                  },
                  divisions: 10,
                  min: 1.0,
                  max: 5.0,
                ),
              ),
            ),
            Text(
              widget.chapter.get('chapterTitle'),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Builder(
                builder: (context) => RichText(
                  text: HTML.toTextSpan(
                    context,
                    htmlContent,
                    defaultTextStyle: TextStyle(
                      fontSize: 5 * _value,
                    ),
                  ),
                  textAlign: TextAlign.right,
                  textScaleFactor: 1.25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
