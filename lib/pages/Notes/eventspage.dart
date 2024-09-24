import 'package:flutter/material.dart';

class Eventspage extends StatefulWidget {
  const Eventspage({super.key});
  static List ongoingevent = [
    "assets/imgs/Rectangle 3904.png",
    "assets/imgs/Rectangle 3904 (1).png",
    "assets/imgs/Rectangle 3904 (2).png",
    "assets/imgs/Rectangle 3904 (4).png",
  ];
  static List upComingevent = [
    "assets/imgs/Rectangle 3904 (4).png",
    "assets/imgs/Rectangle 3904 (5).png",
    "assets/imgs/Rectangle 3904 (6).png",
    "assets/imgs/Rectangle 3904.png",
  ];

  @override
  State<Eventspage> createState() => _EventspageState();
}

class _EventspageState extends State<Eventspage> {
  double height = 225;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const TabBar(
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                indicatorColor: Color.fromRGBO(225, 104, 17, 1),
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: '                 On Going Events        ',
                  ),
                  Tab(text: '               UpComing Events          '),
                ]),
            Expanded(
                child: TabBarView(children: [
              onGoingEvents(context),
              upcomingEvents(context)
            ]))
          ],
        ),
      ),
    );
  }

  Widget onGoingEvents(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: Eventspage.ongoingevent.length,
        shrinkWrap: true,
        itemBuilder: (context, ind) {
          return smallcardnotexpand(context, Eventspage.ongoingevent[ind]);
        });
  }

  Widget upcomingEvents(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: Eventspage.upComingevent.length,
        shrinkWrap: true,
        itemBuilder: (context, ind) {
          return smallcardnotexpand(context, Eventspage.upComingevent[ind]);
        });
  }

  Widget smallcardnotexpand(BuildContext context, img) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  width: double.infinity,
                  img,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  right: 10,
                  top: 5,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(child: Icon(Icons.arrow_drop_down)),
                  ),
                )
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text("22 July 2024"),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Birds Day",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 30, maxWidth: 110),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(225, 104, 17, 1)),
                      onPressed: () {},
                      child: const Center(
                          child: Text(
                        "Join Now",
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.location_on_outlined),
                Text("Adilaide, 33176"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
