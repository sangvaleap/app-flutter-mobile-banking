import 'package:banking_app/pages/home_page.dart';
import 'package:banking_app/theme/colors.dart';
import 'package:banking_app/widgets/bottombar_item.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.appBgColor.withOpacity(.95),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: _buildBottomBar(),
        floatingActionButton: _buildMidButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        body: _buildPage(),
      ),
    );
  }

  Widget _buildMidButton() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.bottomBarColor,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            activeTab = 2;
          });
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.bottomBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            blurRadius: .5,
            spreadRadius: .5,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomBarItem(
              Icons.home_rounded,
              "",
              isActive: activeTab == 0,
              activeColor: AppColor.primary,
              onTap: () {
                setState(() {
                  activeTab = 0;
                });
              },
            ),
            BottomBarItem(
              Icons.account_balance_wallet_rounded,
              "",
              isActive: activeTab == 1,
              activeColor: AppColor.primary,
              onTap: () {
                setState(() {
                  activeTab = 1;
                });
              },
            ),
            BottomBarItem(
              Icons.brightness_1_rounded,
              "",
              isActive: activeTab == 2,
              activeColor: AppColor.primary,
              onTap: () {
                setState(() {
                  activeTab = 2;
                });
              },
            ),
            BottomBarItem(
              Icons.insert_chart_rounded,
              "",
              isActive: activeTab == 3,
              activeColor: AppColor.primary,
              onTap: () {
                setState(() {
                  activeTab = 3;
                });
              },
            ),
            BottomBarItem(
              Icons.person_rounded,
              "",
              isActive: activeTab == 4,
              activeColor: AppColor.primary,
              onTap: () {
                setState(() {
                  activeTab = 4;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage() {
    return IndexedStack(
      index: activeTab,
      children: <Widget>[
        HomePage(),
        Center(
          child: Text(
            "Wallet",
            style: TextStyle(fontSize: 35),
          ),
        ),
        Center(
          child: Text(
            "New",
            style: TextStyle(fontSize: 35),
          ),
        ),
        Center(
          child: Text(
            "Statistics",
            style: TextStyle(fontSize: 35),
          ),
        ),
        Center(
          child: Text(
            "Account",
            style: TextStyle(fontSize: 35),
          ),
        )
      ],
    );
  }
}
