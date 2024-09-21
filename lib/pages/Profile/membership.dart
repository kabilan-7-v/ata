// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Membership extends StatefulWidget {
  const Membership({super.key});

  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  final items = [
    Image.asset("assets/imgs/Frame 2610586.png"),
    Image.asset("assets/imgs/Frame 2610589.png"),
  ];
  final CarouselSliderController _controller = CarouselSliderController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 18,
                    )),
                const Text(
                  "Membership Exclusive",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
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
                        customimageshape("assets/imgs/image 222.png",
                            "Navigating the Future in AI on April 28th @ YSpace\n                                   Markham"),
                        customimageshape(
                            "assets/imgs/image 223.png", "Golf Clinic in June"),
                        customimageshape("assets/imgs/image 224.png",
                            "Yoga in the Park in July"),
                        customimageshape("assets/imgs/image 225.png",
                            "Carrer Convention in September"),
                        customimageshape("assets/imgs/image 226.png",
                            "Coffee Chats & Board Game Night"),
                        customimageshape("assets/imgs/image 227.png",
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
            const Center(
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
                  width: 20,
                ),
                Text(
                  "Membership Exclusive",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, ind) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: items[ind],
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
            width: 290,
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
}
