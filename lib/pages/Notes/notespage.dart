// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:developer';

import 'package:ata/models/eventmodels.dart';
import 'package:ata/pages/Internet/no_internet_page.dart';
import 'package:ata/service/common_service.dart';
import 'package:ata/service/event_service.dart';
import 'package:ata/widget/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:skeleton_shimmer_loading/skeleton_shimmer_loading.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  bool checkevents = true;
  bool selected = true;
  List<OnGoingEventmodels> onGoingEventsLst = [];
  List<UpcomingEventmodels> upcomingEventsLst = [];
  bool isloading = true;
  @override
  void initState() {
    get_internet();
    getEventsData();
    super.initState();
  }

  getEventsData() async {
    onGoingEventsLst = await EventService.fetchOngoingEvents();
    upcomingEventsLst = await EventService.fetchUpcomingEvents();

    isloading = false;
    setState(() {});
  }

  bool connect_internet = false;

  get_internet() async {
    bool isConnected = await InternetConnection().hasInternetAccess;
    if (!isConnected) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NoInternetPage()),
          (e) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return checkevents == false
        ? tabbarevents(context)
        : GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
                backgroundColor: ataBackgroundcolor,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 120,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: Image.asset("assets/imgs/boy.png"),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        child: Text(
                          "Find?\nEvents in one Place! 💣",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                        child: Text(
                          "Event management is the creation and\ndevelopment of small and large-scale\npersonal or corporate event such a festival\nconferences extra",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 180,
                          ),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: orange),
                              onPressed: () {
                                setState(() {
                                  checkevents = false;
                                });
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    "View Events",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                  ),
                )),
          );
  }

  tabbarevents(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppShimmerLoading(
        isLoading: isloading,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: ataBackgroundcolor,
            body: Column(
              children: [
                const SizedBox(
                  height: 35,
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
                      SizedBox(
                          height: 45,
                          child: Center(
                              child: Text("     Ongoing Events          ",
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                  )))),
                      SizedBox(
                          height: 45,
                          child: Center(
                              child: Text(
                            "     Upcoming Events          ",
                            style: TextStyle(fontFamily: "Montserrat"),
                          )))
                      // Tab(
                      //   text: '          On Going Events          ',
                      // ),
                      // Tab(text: '          UpComing Events          '),
                    ]),
                Expanded(
                    child: TabBarView(children: [
                  onGoingEvents(context),
                  upcomingEvents(context)
                ])),
                const SizedBox(
                  height: 65,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget onGoingEvents(BuildContext context) {
    return onGoingEventsLst.isEmpty
        ? const Center(
            child: Text(
            "No Ongoing Events",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ))
        : ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: onGoingEventsLst.length,
            shrinkWrap: true,
            itemBuilder: (context, ind) {
              return ongoineventCard(
                  context,
                  "https://picsum.photos/id/237/300/100",
                  onGoingEventsLst[ind].isselected!,
                  ind);
            });
  }

  Widget upcomingEvents(BuildContext context) {
    return upcomingEventsLst.isEmpty
        ? const Center(
            child: Text(
            "No Upcoming Events",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ))
        : ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: upcomingEventsLst.length,
            shrinkWrap: true,
            itemBuilder: (context, ind) {
              return upcomingeventCart(context, "https://picsum.photos/300/100",
                  upcomingEventsLst[ind].isselected!, ind);
            });
  }

  ongoineventCard(BuildContext context, String img, bool select, ind) {
    bool selected = select;

    return GestureDetector(
      onTap: () {
        onGoingEventsLst[ind].isselected = !onGoingEventsLst[ind].isselected!;

        selected = !selected;
        setState(() {});
      },
      child: AnimatedSize(
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 1000),
        child: Container(
          height: select == true ? 220 : 330,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
          child: ShimmerItem(
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
                      child: CachedNetworkImage(
                        width: double.infinity,
                        height: select == true ? 120 : 170,
                        imageUrl: img,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Container(
                          width: double.infinity,
                          height: select == true ? 120 : 170,
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
                selected == true
                    ? isnotselected(
                        onGoingEventsLst[ind].date,
                        onGoingEventsLst[ind].eventname,
                        onGoingEventsLst[ind].location!)
                    : isselected(onGoingEventsLst[ind].date,
                        onGoingEventsLst[ind].description!)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget isselected(String date, String descrip) {
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
                  width: 175,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(CommonService.formatdateForEvents(date)),
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
                  width: 110,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(CommonService.taketime(date)),
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
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
            child: Text(
              descrip,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 30, maxWidth: 115),
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

  Widget isnotselected(String date, String eventname, String location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(CommonService.formatdateForEvents(date)),
        ),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              eventname,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 30, maxWidth: 120),
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
            Text(location),
          ],
        )
      ],
    );
  }

  upcomingeventCart(BuildContext context, String img, bool select, ind) {
    bool selected = select;

    return GestureDetector(
      onTap: () {
        upcomingEventsLst[ind].isselected = !upcomingEventsLst[ind].isselected!;

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
          child: ShimmerItem(
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
                        child: CachedNetworkImage(
                          width: double.infinity,
                          height: select == true ? 110 : 170,
                          imageUrl: img,
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
                          child:
                              const Center(child: Icon(Icons.arrow_drop_down)),
                        ),
                      )
                    ],
                  ),
                  selected == true
                      ? isnotselected(
                          upcomingEventsLst[ind].date,
                          upcomingEventsLst[ind].eventname,
                          upcomingEventsLst[ind].location!)
                      : isselected(upcomingEventsLst[ind].date,
                          upcomingEventsLst[ind].description!)
                ]),
          ),
        ),
      ),
    );
  }
}
