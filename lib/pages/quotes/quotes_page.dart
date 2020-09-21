import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

import 'widget/list_quotes.dart';
import 'widget/one_quote.dart';
import '../about/about_page.dart';

class QuotesPage extends StatefulWidget {
  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quote App'),
        ),
        bottomNavigationBar: MotionTabBar(
          tabOneName: "Random",
          tabTwoName: "List",
          tabThreeName: "About",
          tabOneIcon: Icons.home,
          tabTwoIcon: Icons.search,
          tabThreeIcon: Icons.account_box,
          tabIconColor: Theme.of(context).primaryColor,
          tabSelectedColor: Theme.of(context).primaryColor,
          textStyle: TextStyle(color: Theme.of(context).primaryColor),
          onTabItemSelected: (int value) {
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              child: Center(
                child: OneQuote(),
              ),
            ),
            Container(
              child: Center(
                child: ListQuotes(),
              ),
            ),
            Container(
              child: Center(
                child: AboutPage(),
              ),
            ),
          ],
        ));
  }
}
