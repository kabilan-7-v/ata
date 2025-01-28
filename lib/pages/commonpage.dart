// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:ata/pages/Blog/blog_list_page.dart';
import 'package:ata/pages/Blog/blog_page.dart';
import 'package:ata/pages/Home/homepage.dart';
import 'package:ata/pages/Notes/notespage.dart';
import 'package:ata/pages/Profile/profilepage.dart';
import 'package:ata/service/login.dart';
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
  void initState() {
    setUserDetails(context);
    super.initState();
  }

  // userinit() {
  //   setUserDetails(context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      body: Stack(
        children: [
          IndexedStack(index: tab, children: [
            const Homepage(),
            const NotesPage(),
            const BlogListPage(),
            const Profilepage(),
          ]),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
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
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
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
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Image.asset(
                                          "assets/common_icon/Home unfill.png")),
                                  const Text(
                                    "Home",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                          "assets/common_icon/Home fill.png")),
                                  const Text(
                                    "Home",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: orange),
                                  )
                                ],
                              )),
                    InkWell(
                        onTap: () {
                          tab = 1;
                          setState(() {});
                        },
                        child: tab != 1
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Image.asset(
                                          "assets/common_icon/Event Unfill.png")),
                                  const Text(
                                    "Event",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                          "assets/common_icon/Event Fill.png")),
                                  const Text(
                                    "Event",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: orange),
                                  )
                                ],
                              )),
                    InkWell(
                        onTap: () {
                          setState(() {
                            tab = 2;
                          });
                        },
                        child: tab != 2
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Image.asset(
                                          "assets/icons/Blog Black.png")),
                                  const Text(
                                    "Blog",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                          "assets/icons/Blog Orange with BG.png")),
                                  const Text(
                                    "Blog",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: orange),
                                  )
                                ],
                              )),
                    InkWell(
                        onTap: () {
                          setState(() {
                            tab = 3;
                          });
                        },
                        child: tab != 3
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Image.asset(
                                          "assets/common_icon/Profile Unfill.png")),
                                  const Text(
                                    "Profile",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset(
                                          "assets/common_icon/Profile Fill.png")),
                                  const Text(
                                    "Profile",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: orange),
                                  )
                                ],
                              )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
