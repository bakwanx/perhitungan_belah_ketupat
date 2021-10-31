import 'package:flutter/material.dart';
import 'package:nim_1801013026/pages/keliling_ketupat.dart';
import 'package:nim_1801013026/pages/luas_ketupat.dart';
import 'package:nim_1801013026/theme.dart';

class KetupatMain extends StatefulWidget {

  @override
  State<KetupatMain> createState() => _KetupatMainState();
}

class _KetupatMainState extends State<KetupatMain> with SingleTickerProviderStateMixin {
  String titleToolbar;

  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  appBar(){
    return AppBar(
      title: Text(
          'Perhitungan Ketupat'
      ),
      backgroundColor: primaryColor,
      bottom: TabBar(
        controller: tabController,
        tabs: [
          Tab(icon: Image.asset('assets/keliling_kubus.png', width: 25,), text: "Keliling"),
          Tab(icon: Image.asset('assets/luas_kubus.png', width: 18,), text: "Luas"),
        ],
      ),
      actions: [
        IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/signin');
          },
          icon: Image.asset(
            iconLogOut,
            width: 20,
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: TabBarView(
        controller: tabController,
        children: [
          KelilingKetupat(),
          LuasKetupat()
        ]
      ),
    );
  }
}
