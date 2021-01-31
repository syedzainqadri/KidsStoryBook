import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsstorybook/Screens/view/TabViews/HomeTabs/Books.dart';
import 'package:kidsstorybook/Widgets/AppBarActions.dart';
import '../searchView.dart';

class ExplorePageAppBar extends StatefulWidget {
  const ExplorePageAppBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExplorePageAppBarState();
}

class _ExplorePageAppBarState extends State<ExplorePageAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              AppBarActions(),
            ],
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0.0,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 260.0,
            collapsedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              titlePadding: EdgeInsets.only(left: 20),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 15.0),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Explore',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
                    child: Container(
                      height: 5,
                      width: 35,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: FloatingActionButton.extended(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.grey[300],
                    autofocus: false,
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      Get.to(SearchView());
                    },
                    label: Container(
                        width: 350,
                        height: 50,
                        child: Center(
                            child: Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Title, Author, or Topic'),
                          ],
                        ))),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 25.0, left: 25.0, bottom: 10),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                Wrap(
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: [
                    FlatButton(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          top: 15.0,
                          bottom: 15,
                          right: 15,
                        ),
                        child: Text(
                          'Psychology',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      color: Colors.grey[300],
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(height: 500, child: Books()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
