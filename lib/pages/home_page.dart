import 'package:badges/badges.dart';
import 'package:banking_app/data/json.dart';
import 'package:banking_app/theme/colors.dart';
import 'package:banking_app/widgets/service_box.dart';
import 'package:banking_app/widgets/avatar_image.dart';
import 'package:banking_app/widgets/balance_card.dart';
import 'package:banking_app/widgets/transaction_item.dart';
import 'package:banking_app/widgets/user_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(
            height: 25,
          ),
          _buildBalance(),
          const SizedBox(
            height: 35,
          ),
          _buildServices(),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Send Again",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: _buildRecentUsers(),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 15),
            child: _buildTransactionTitle(),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: _buildTransanctions(),
          ),
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      height: 130,
      padding: EdgeInsets.only(left: 20, right: 20, top: 35),
      decoration: BoxDecoration(
        color: AppColor.appBgColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AvatarImage(profile, isSVG: false, width: 35, height: 35),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Sangvaleap,",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          _buildNotification()
        ],
      ),
    );
  }

  Widget _buildNotification() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Badge(
        padding: EdgeInsets.all(3),
        position: BadgePosition.topEnd(top: -5, end: 2),
        badgeContent: Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
        child: Icon(Icons.notifications_rounded),
      ),
    );
  }

  Widget _buildTransactionTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Transactions",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Today",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Icon(Icons.expand_more_rounded),
      ],
    );
  }

  Widget _buildBalance() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BalanceCard(
            balance: r"$860,500.00",
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColor.secondary,
                shape: BoxShape.circle,
                border: Border.all(),
              ),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildServices() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: ServiceBox(
            title: "Send",
            icon: Icons.send_rounded,
            bgColor: AppColor.green,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: ServiceBox(
            title: "Request",
            icon: Icons.arrow_circle_down_rounded,
            bgColor: AppColor.yellow,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: ServiceBox(
            title: "More",
            icon: Icons.widgets_rounded,
            bgColor: AppColor.purple,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }

  Widget _buildRecentUsers() {
    var users = recentUsers.map(
      (e) => Padding(
        padding: const EdgeInsets.only(right: 15),
        child: UserBox(user: e),
      ),
    );

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: _buildSearchBox(),
          ),
          ...users
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.search_rounded),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  Widget _buildTransanctions() {
    return Column(
      children: List.generate(
        transactions.length,
        (index) => TransactionItem(transactions[index]),
      ),
    );
  }
}
