import 'package:flutter/material.dart';
import 'package:kidsstorybook/Screens/view/TabViews/LibraryTabs/Articles.dart';
import 'package:kidsstorybook/Screens/view/TabViews/LibraryTabs/Chapters.dart';
import 'package:kidsstorybook/Screens/view/TabViews/LibraryTabs/Emails.dart';
import 'package:kidsstorybook/Utils/Constants.dart';
import 'package:kidsstorybook/Widgets/AppBarActions.dart';

class LibraryPageAppBar extends StatefulWidget {
  const LibraryPageAppBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LibraryPageAppBarState();
}

class _LibraryPageAppBarState extends State<LibraryPageAppBar>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            actions: [
              AppBarActions(),
            ],
            backgroundColor: Colors.white,
            elevation: 0.0,
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 260.0,
            flexibleSpace: FlexibleSpaceBar(
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
                        'My Library',
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
                    height: 30,
                  )
                ],
              ),
            ),
            bottom: TabBar(
              labelColor: kSelectedText,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.green[300],
              indicatorWeight: 7,
              unselectedLabelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(text: 'Chapters'),
                Tab(text: 'Articles'),
                Tab(text: 'Emails'),
              ],
              controller: controller,
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(controller: controller, children: <Widget>[
              Center(child: Chapters()),
              Center(child: Articles()),
              Center(child: Emails()),
            ]),
          ),
        ],
      ),
    );
  }
}
