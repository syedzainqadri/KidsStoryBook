import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../ChapterText.dart';

class Chapters extends StatefulWidget {
  @override
  _ChaptersClassState createState() => _ChaptersClassState();
}

class _ChaptersClassState extends State<Chapters> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('Chapters').orderBy('lastUpdated').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var chapter = snapshot.data.docs;
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: chapter.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(chapter[index].get("chapterTitle"));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChapterText(chapter: chapter[index])));
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black26,
                                  width: 1.0,
                                ),
                              )),
                          height: 100,
                          child: Center(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    index.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  chapter[index].get(
                                    'chapterTitle',
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }
}
