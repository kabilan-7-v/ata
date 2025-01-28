import 'package:ata/service/membership_service.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

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
  @override
  void initState() {
    membershipdetailsfetch(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 40,
        backgroundColor: const Color.fromARGB(255, 247, 229, 214),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 247, 229, 214),
              ),
              child: const Column(
                children: [
                  Text("Silver-Single",
                      style: TextStyle(
                          fontSize: 34,
                          color: orange,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            benfitcard(context),
            const SizedBox(
              height: 16,
            ),
            Center(
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
                              color: const Color.fromARGB(255, 247, 229, 214),
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
                                          fontWeight: FontWeight.bold))),
                              const Spacer(),
                              Container(
                                height: 28,
                                width: 28,
                                decoration: const BoxDecoration(
                                    color: orange, shape: BoxShape.circle),
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
                      ansone,
                    ),
                  )
                : const SizedBox(),
            line(context),
            //////////////////////////////////////////// quess one /////////////////////////////////////
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
                    child: Text(ansone),
                  )
                : const SizedBox(),
            line(context),
            //////////////////////////////////////////// quess one /////////////////////////////////////
            GestureDetector(
              onTap: () {
                four = !four;
                setState(() {});
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    quesFour,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  const Spacer(),
                  four
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
            four
                ? Padding(
                    padding: const EdgeInsets.only(left: 14, top: 8, right: 8),
                    child: Text(ansone),
                  )
                : const SizedBox(),
            line(context),
            ////////////////////////////////////////
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
    return Container(
      
    );
  }

  Widget benfitcard(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
            height: 47,
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
            child: Row(
              children: [
                const Center(
                    child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "Membership valid till 31 Jul'25",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16, height: 2),
                  ),
                )),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color.fromRGBO(222, 250, 238, 1),
                    ),
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text("ACTIVE",
                          style: TextStyle(
                              color: Color.fromRGBO(30, 84, 71, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    )),
                  ),
                )
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
