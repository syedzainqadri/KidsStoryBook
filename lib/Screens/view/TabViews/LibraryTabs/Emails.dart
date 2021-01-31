import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../../chaptersListView.dart';

class Emails extends StatefulWidget {
  @override
  _EmailsState createState() => _EmailsState();
}

class _EmailsState extends State<Emails> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: db.collection('Emails').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var doc = snapshot.data.docs;
            return ListView.builder(
                addSemanticIndexes: true,
                shrinkWrap: false,
                itemCount: doc.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        print(doc[index].id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChapterList(doc[index].id)),
                        );
                      },
                      child: Card(
                        color: Colors.transparent,
                        shadowColor: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Text(
                                                doc[index].get('tag'),
                                              ),
                                              // color: Color(
                                              //     doc[index].get('color')),
                                            ),
                                            // BookTag(),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, top: 10.0),
                                        child: Container(
                                          alignment: Alignment.bottomLeft,
                                          child:
                                              Text(doc[index].get('emailTitle'),
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: IconButton(
                                          color: Colors.grey,
                                          icon: Icon(Icons.more_horiz),
                                          onPressed: () {
                                            //ToDo: Change the share message here as you want
                                            Share.share(
                                                'Check out kidsstorybook https://www.kidsstorybook.com',
                                                subject:
                                                    'Ustadian Book Reading App');
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                          offset: Offset(0.0, 7.0),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxHeight: 100, maxWidth: 100),
                                        child: Image.network(
                                          doc[index].get('image'),
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
