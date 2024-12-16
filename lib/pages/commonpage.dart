// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:ata/pages/Home/homepage.dart';
import 'package:ata/pages/Notes/notespage.dart';
import 'package:ata/pages/Profile/profilepage.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class Commonpage extends StatefulWidget {
  const Commonpage({super.key});

  @override
  State<Commonpage> createState() => _CommonpageState();
}

class _CommonpageState extends State<Commonpage> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: tab,
          children: [const Homepage(), const NotesPage(), const Profilepage()]),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: ataBackgroundcolor,

              // boxShadow: const [
              //   BoxShadow(
              //     color: Colors.white,
              //     spreadRadius: 5,
              //     blurRadius: 7,
              //   )
              // ],
              border: Border.all(
                color: const Color.fromRGBO(249, 225, 207, 1),
                width: 3,
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      tab = 0;
                    });
                  },
                  child: tab != 0
                      ? SizedBox(
                          height: 30,
                          width: 30,
                          child:
                              Image.asset("assets/common_icon/Home unfill.png"))
                      : SizedBox(
                          height: 40,
                          width: 40,
                          child:
                              Image.asset("assets/common_icon/Home fill.png"))),
              InkWell(
                  onTap: () {
                    tab = 1;
                    setState(() {});
                  },
                  child: tab != 1
                      ? SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              "assets/common_icon/Event Unfill.png"))
                      : SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                              "assets/common_icon/Event Fill.png"))),
              InkWell(
                  onTap: () {
                    setState(() {
                      tab = 2;
                    });
                  },
                  child: tab != 2
                      ? SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(
                              "assets/common_icon/Profile Unfill.png"))
                      : SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                              "assets/common_icon/Profile Fill.png"))),
            ],
          ),
        ),
      ),
    );
  }
}
