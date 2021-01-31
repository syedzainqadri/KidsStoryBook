import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: TextField(
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "Title, authors, or topics,"),
          onChanged: (val) => initiateSearch(val),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: name != "" && name != null
            ? FirebaseFirestore.instance
                .collection('Books')
                .where("searchIndex", arrayContains: name)
                .snapshots()
            : FirebaseFirestore.instance.collection("books").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading...');
            default:
              // ignore: unused_local_variable
              var doc = snapshot.data.docs;
              return ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return ListTile(
                    title: Text(document['bookName']),
                    // onTap: (){
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //       builder: (context) => ChapterList(doc.)),);
                    // },
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }

  void initiateSearch(String val) {
    setState(() {
      name = val.trim();
    });
  }
}
