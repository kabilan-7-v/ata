import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  bool checkevents = true;
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return checkevents == false
        ? tabbarevents(context)
        : Scaffold(
            backgroundColor: ataBackgroundcolor,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Image.asset("assets/imgs/boy.png"),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Text(
                    "Find?\nEvents in one Place! 💣",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  child: Text(
                    "Event management is the creation and\ndevelopment of small and large-scale\npersonal or corporate event such a festival\nconferences extra",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 150,
                    ),
                    child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: orange),
                        onPressed: () {
                          setState(() {
                            checkevents = false;
                          });
                        },
                        child: const Row(
                          children: [
                            Spacer(),
                            Icon(
                              Icons.arrow_right_alt,
                              color: Colors.white,
                              size: 40,
                            )
                          ],
                        )),
                  ),
                )
              ],
            ));
  }

  tabbarevents(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ataBackgroundcolor,
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
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                tabs: [
                  Tab(
                    text: '          On Going Events          ',
                  ),
                  Tab(text: '          UpComing Events          '),
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
        itemCount: ongoingevent.length,
        shrinkWrap: true,
        itemBuilder: (context, ind) {
          return ongoineventCard(
              context, ongoingevent[ind][0], ongoingevent[ind][1], ind);
        });
  }

  Widget upcomingEvents(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: upComingevent.length,
        shrinkWrap: true,
        itemBuilder: (context, ind) {
          return upcomingeventCart(
              context, upComingevent[ind][0], upComingevent[ind][1], ind);
        });
  }

  ongoineventCard(BuildContext context, String img, bool select, ind) {
    bool selected = select;

    return GestureDetector(
      onTap: () {
        ongoingevent[ind][1] = !ongoingevent[ind][1];

        selected = !selected;
        setState(() {});
      },
      child: AnimatedSize(
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 1000),
        child: Container(
          height: select == true ? 220 : 350,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 1,
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.asset(
                      width: double.infinity,
                      height: select == true ? 110 : 170,
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Container(
                        width: double.infinity,
                        height: select == true ? 110 : 170,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4))),
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
                      child: Center(
                          child: Icon(selected == false
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down)),
                    ),
                  )
                ],
              ),
              selected == true ? isnotselected() : isselected()
            ],
          ),
        ),
      ),
    );
  }

  Widget isselected() {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Date",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  width: 142,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                        )
                      ]),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text("22th  June, 2024"),
                      ),
                      SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset("assets/icons/event.png"))
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Time",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 32,
                  width: 89,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                        )
                      ]),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text("4.00 PM"),
                      ),
                      SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset("assets/icons/timer.png")),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
          child: Text(
            "The performance maybe by a single musician sometimes such as an Archestra,chair or band",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 30, maxWidth: 110),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: orange),
              onPressed: () {},
              child: const Center(
                  child: Text(
                "Join Now",
                style: TextStyle(color: Colors.white),
              ))),
        ),
      ],
    );
  }

  Widget isnotselected() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("22 July 2024"),
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
              constraints: const BoxConstraints(maxHeight: 30, maxWidth: 110),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: orange),
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
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            SizedBox(
                height: 20,
                width: 20,
                child: Image.asset("assets/icons/location.png")),
            const Text("Adilaide, 33176"),
          ],
        )
      ],
    );
  }

  upcomingeventCart(BuildContext context, String img, bool select, ind) {
    bool selected = select;

    return GestureDetector(
      onTap: () {
        upComingevent[ind][1] = !upComingevent[ind][1];

        selected = !selected;
        setState(() {});
      },
      child: AnimatedSize(
        curve: Curves.linear,
        duration: const Duration(milliseconds: 1000),
        child: Container(
          height: select == true ? 200 : 340,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 1,
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.asset(
                      width: double.infinity,
                      height: select == true ? 110 : 170,
                      img,
                      fit: BoxFit.cover,
                    ),
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
              selected == true ? isnotselected() : isselected()
            ],
          ),
        ),
      ),
    );
  }
}
