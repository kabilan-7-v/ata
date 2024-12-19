// ignore_for_file: depend_on_referenced_packages

import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Membership extends StatefulWidget {
  const Membership({super.key});

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  final CarouselSliderController _controller = CarouselSliderController();

  int currentIndex = 0;

  List member = [
    ["Silver-Single", "10"],
    ["Silver-Family", "20"],
    ["Silver-Single", "50"]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: ataBackgroundcolor,
        title: const Text(
          'Membership Exclusive',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  child: CarouselSlider(
                      carouselController: _controller, // Give the controller
                      options: CarouselOptions(
                          height: 230,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          // autoPlay: true,
                          viewportFraction: 1),
                      items: [
                        customimageshape(
                            "assets/membership_exclusive/image 222.png",
                            "Navigating the Future in AI on April 28th @ YSpace\nMarkham"),
                        customimageshape(
                            "assets/membership_exclusive/image 223.png",
                            "Golf Clinic in June"),
                        customimageshape(
                            "assets/membership_exclusive/image 224.png",
                            "Yoga in the Park in July"),
                        customimageshape(
                            "assets/membership_exclusive/image 225.png",
                            "Carrer Convention in September"),
                        customimageshape(
                            "assets/membership_exclusive/image 226.png",
                            "Coffee Chats & Board Game Night"),
                        customimageshape(
                            "assets/membership_exclusive/image 227.png",
                            " + More Events to Come!"),
                      ]),
                ),
                Positioned(
                    top: 70,
                    left: 5,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                          onPressed: () {
                            _controller.previousPage();
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_left_outlined,
                            size: 18,
                            color: Colors.white,
                          )),
                    )),
                Positioned(
                    right: 5,
                    top: 70,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                          onPressed: () {
                            _controller.nextPage();
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            size: 18,
                            color: Colors.white,
                          )),
                    )),
              ],
            ),
            Center(
              child: DotsIndicator(
                dotsCount: 6,
                position: currentIndex,
                decorator: const DotsDecorator(activeColor: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "What is the ATA’S Membership     \n Program?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 3,
                    width: 3,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "The Adelaide Tamil Association (ATA) is \nproud to announce the newly revamped \nMembership program.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 3,
                    width: 3,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "Members will save over 150 on various\nprofessional development & networking\nevents. Our goal is to help professionals\nget the support they need to accelerate\ntheir success. All proceeds will be donated\nto the Tamil Community Centre initiative.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Membership Level",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 270,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: member.length,
                  itemBuilder: (context, ind) {
                    return membershipcard(
                      member[ind][0],
                      member[ind][1],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget customimageshape(img, txt) {
    return Column(
      children: [
        Container(
            height: 180,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(img), fit: BoxFit.cover))),
        const SizedBox(
          height: 5,
        ),
        Center(child: Text(txt))
      ],
    );
  }

  Widget membershipcard(String text, String cost) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Stack(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      "assets/imgs/Membesrship.png",
                      fit: BoxFit.cover,
                    )),
              ),
            ]),
          ),
          const Positioned(
            top: 115,
            left: 80,
            child: Text(
              "\$",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 80,
            left: 100,
            child: Text(
              cost,
              style: const TextStyle(fontSize: 65, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 85,
            left: 80,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.9)),
            ),
          ),
          const Positioned(
            top: 120,
            left: 20,
            child: Text(
              "\$",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 95,
            left: 35,
            child: Text(
              cost,
              style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),
          ),
          const Positioned(
            top: 145,
            left: 20,
            child: Text(
              "Annual Membership",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            top: 180,
            left: 30,
            child: Text(
              text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }
}
