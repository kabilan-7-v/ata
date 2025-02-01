import 'dart:developer';

import 'package:ata/cubit/usercubit.dart';
import 'package:ata/pages/Profile/drawer.dart';
import 'package:ata/service/common_service.dart';
import 'package:ata/service/membership_service.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Newmembership extends StatefulWidget {
  const Newmembership({super.key});

  @override
  State<Newmembership> createState() => _NewmembershipState();
}

class _NewmembershipState extends State<Newmembership> {
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;
  List<String> membershhiplst = [];
  List<dynamic> family = [];
  @override
  void initState() {
    setmembership();
    super.initState();
  }

  setmembership() async {
    membershhiplst = await membershipdetailsfetch(context);
    setState(() {});
    if (membershhiplst.isNotEmpty) {
      if (membershhiplst[0] != "Single") {
        // log();
        family = await membershipdetailsfamily(
            context, membershhiplst[0].toString());
        log(family.toString());
        setState(() {});
      }
      log(membershhiplst.toString());
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      appBar: AppBar(
        title: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              context.watch<UserCubit>().state.userName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        scrolledUnderElevation: 0,
        toolbarHeight: 50,
        backgroundColor: const Color.fromARGB(255, 247, 229, 214),
      ),
      endDrawer: const Customdrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 35,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 247, 229, 214),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        "+91-7010185919 , ",
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      Text(context.watch<UserCubit>().state.email,
                          style: const TextStyle(fontSize: 11))
                    ],
                  )
                  // Text("Silver-Single",
                  //     style: TextStyle(
                  //         fontSize: 34,
                  //         color: orange,
                  //         fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            membershhiplst.isNotEmpty && membershhiplst[1] != ""
                ? benfitcard(context)
                : const SizedBox(),
            const SizedBox(
              height: 16,
            ),
            family.isNotEmpty
                ? Row(children: [
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Family Details",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.grey, ataBackgroundcolor])),
                      ),
                    )
                  ])
                : const SizedBox.shrink(),
            const SizedBox(
              height: 16,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10, top: 10),
            //   child: Text(
            //     "Name:${context.watch<UserCubit>().state.userName}",
            //     st
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10, top: 10),
            //   child: Text(
            //     "Name:${context.watch<UserCubit>().state.email}",
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 10),
            //   child:
            //       Text("Phno:${context.watch<UserCubit>().state.phno}"),
            // )
            // Row(
            //   children: [

            //     Text(
            //       "Family Details ",
            //       style: TextStyle(
            //           fontSize: 18,
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold),
            //     ),
            //   ],
            // ),
            family.isNotEmpty && family[0]["spouse"] != null
                ? Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width - 16,
                        decoration: BoxDecoration(
                            color: ataBackgroundcolor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              )
                            ]),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Text(
                                        family[0]["spouse"]["name"],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        const Text("Children , "),
                                        Text(
                                            "Age: ${family[0]["spouse"]["age"]}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              family.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: family.isNotEmpty
                                          ? family[0]["children"].length
                                          : 0,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, ind) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, top: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8),
                                                child: Text(
                                                  family[0]["children"][ind]
                                                      ["name"],
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  const Text("Children , "),
                                                  Text(
                                                      "Age: ${family[0]["children"][ind]["age"]}"),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      })
                                  : const SizedBox(),
                              SizedBox(
                                height: 16,
                              )
                            ])),
                  )
                : const SizedBox(),
            family.isEmpty
                ? Center(
                    child: InkWell(
                      onTap: () {
                        CommonService.launchurl(
                            "https://adelaidetamil.com.au/membership/");
                      },
                      child: Container(
                        height: 127,
                        width: MediaQuery.of(context).size.width - 16,
                        decoration: BoxDecoration(
                            color: ataBackgroundcolor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 12.0, top: 5),
                                child: Text(
                                  "Upgrade Membership",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 12.0,
                                ),
                                child: Text(
                                  "Get more benefits",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Container(
                                  height: 40,
                                  width: 190,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 247, 229, 214),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Center(
                                          child: Text("Upgrade now",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: orange,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      const Spacer(),
                                      Container(
                                        height: 28,
                                        width: 28,
                                        decoration: const BoxDecoration(
                                            color: orange,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          color: ataBackgroundcolor,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            customtitle("One Lite FAQs"),
            //// quess one /////////////////////////////////////
            GestureDetector(
              onTap: () {
                one = !one;
                setState(() {});
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    quesone,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  const Spacer(),
                  one
                      ? const Icon(
                          Icons.keyboard_arrow_up,
                          color: orange,
                        )
                      : const Icon(
                          Icons.keyboard_arrow_down,
                          color: orange,
                        ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
            one
                ? Padding(
                    padding: const EdgeInsets.only(left: 14, top: 8, right: 8),
                    child: Text(ansone),
                  )
                : const SizedBox(),
            line(context),
            ////////////////////////////////////////
            //// quess one /////////////////////////////////////
            GestureDetector(
              onTap: () {
                two = !two;
                setState(() {});
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    quesTwo,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  const Spacer(),
                  two
                      ? const Icon(
                          Icons.keyboard_arrow_up,
                          color: orange,
                        )
                      : const Icon(
                          Icons.keyboard_arrow_down,
                          color: orange,
                        ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
            two
                ? Padding(
                    padding: const EdgeInsets.only(left: 14, top: 8, right: 8),
                    child: Text(
                      anstwo,
                    ),
                  )
                : const SizedBox(),
            line(context),
            //////////////////////////////////////////// quess two /////////////////////////////////////
            GestureDetector(
              onTap: () {
                three = !three;
                setState(() {});
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    quesThree,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  const Spacer(),
                  three
                      ? const Icon(
                          Icons.keyboard_arrow_up,
                          color: orange,
                        )
                      : const Icon(
                          Icons.keyboard_arrow_down,
                          color: orange,
                        ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            ),
            three
                ? Padding(
                    padding: const EdgeInsets.only(left: 14, top: 8, right: 8),
                    child: Text(ansthree),
                  )
                : const SizedBox(),
            line(context),
            SizedBox(
              height: 60,
            )
            //////////////////////////////////////////// quess three /////////////////////////////////////
          ],
        ),
      ),
    );
  }

  Widget line(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Center(
        child: Container(
          height: 1,
          width: MediaQuery.of(context).size.width - 16,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }

  Widget sliverFamily() {
    return Container();
  }

  Widget benfitcard(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
            height: 90,
            width: MediaQuery.of(context).size.width - 16,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ],
              color: ataBackgroundcolor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Text(
                          membershhiplst.length >= 1 ? membershhiplst[1] : "",
                          style: const TextStyle(
                              fontSize: 24,
                              color: orange,
                              fontWeight: FontWeight.bold)),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Color.fromRGBO(222, 250, 238, 1),
                        ),
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text("ACTIVE",
                              style: TextStyle(
                                  color: Color.fromRGBO(30, 84, 71, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Membership valid till 31 Jul'25",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16, height: 2),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget commonbenefittext(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const Text(
            "on all restaurants upto to 7km",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  Widget customtitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
      child: SafeArea(
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.grey.shade300,
                      Colors.grey.shade300,
                      Colors.white70
                    ]),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
