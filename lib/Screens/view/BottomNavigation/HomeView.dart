import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:kidsstorybook/Controllers/authController.dart';
import 'package:kidsstorybook/Controllers/userController.dart';
import 'package:kidsstorybook/Screens/view/TabViews/HomeTabs/Books.dart';
import 'package:kidsstorybook/Screens/view/TabViews/HomeTabs/New.dart';
import 'package:kidsstorybook/Screens/view/TabViews/HomeTabs/Trending.dart';
import 'package:kidsstorybook/Services/database.dart';
import 'package:kidsstorybook/Utils/Constants.dart';
import 'package:kidsstorybook/Widgets/AppBarActions.dart';

class HomePageAppBar extends StatefulWidget {
  const HomePageAppBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar>
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
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 10),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      child: GetX<UserController>(
                        initState: (_) async {
                          Get.find<UserController>().user = await Database()
                              .getUser(Get.find<AuthController>().user.uid);
                        },
                        builder: (_) {
                          if (_.user.name != null) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "Hi",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${_.user.name},',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'ذرا سا دیہان لگانے کو تیار ہیں ؟',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10.0, left: 15.0),
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Home',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, bottom: 10.0),
                                  child: Container(
                                    height: 5,
                                    width: 35,
                                    color: Colors.green[300],
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
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
                Tab(text: 'Books'),
                Tab(text: 'Trending'),
                Tab(text: 'New'),
              ],
              controller: controller,
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(controller: controller, children: <Widget>[
              Center(child: Books()),
              Center(child: Trending()),
              Center(child: New()),
            ]),
          ),
        ],
      ),
    );
  }
}
