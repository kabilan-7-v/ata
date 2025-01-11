// ignore_for_file: prefer_const_constructors

import 'package:ata/cubit/usercubit.dart';
import 'package:ata/models/homemodels.dart';
import 'package:ata/pages/Home/detailviewevent.dart';
import 'package:ata/service/common_service.dart';
import 'package:ata/service/home_service.dart';
import 'package:ata/widget/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_shimmer_loading/skeleton_shimmer_loading.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Popularevents> filteredEvents = [];
  List<Latestpost> filteredPost = [];

  final TextEditingController searchController = TextEditingController();
  List<Popularevents> popularEvents = [];
  List<Latestpost> latestPosts = [];
  List<Sponsers> sponsers = [];
  bool isloading = true;
  bool issearch = false;
  bool issearchwidgetShow = false;
  @override
  void initState() {
    getHomeData();
    super.initState();
  }

  getHomeData() async {
    popularEvents = await HomeService.fetchPopularevents();
    latestPosts = await HomeService.fetchLatestPost();
    sponsers = await HomeService.fetchSponsers();
    setState(() {
      isloading = false;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

////////////////////////////////////////////////////////////////////////////////////// SEARCH ////////////////////////////////////////////
  void searchEvents(String query) {
    if (searchController.text.isNotEmpty) {
      setState(() {
        issearchwidgetShow = true;
      });
    }
    final events = popularEvents.where((event) {
      return event.eventname.toLowerCase().contains(query.toLowerCase());
    }).toList();
    final posts = latestPosts.where((event) {
      return event.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredEvents = events;
      filteredPost = posts;
    });
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<Seasonlst>(context).seasons;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        issearch = false;
        issearchwidgetShow = false;
        setState(() {});
      },
      child: Scaffold(
        backgroundColor: ataBackgroundcolor,
        body: homeBody(),
      ),
    );
  }

  Widget buildMainBanner(img, name) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            )),
        Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget isSearch() {
    return AppShimmerLoading(
        isLoading: isloading,
        child: filteredEvents.isEmpty && filteredPost.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.search,
                    size: 50,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Search Result Not Found",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: filteredEvents.isEmpty && filteredPost.isEmpty
                  //     ? MainAxisAlignment.center
                  //     : MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 165,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          filteredEvents.isEmpty
                              ? SizedBox()
                              : _buildSectionTitle('Popular Events'),
                          ListView.builder(
                            itemCount: filteredEvents.length,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return _buildEventCard(
                                  filteredEvents[index].img,
                                  context,
                                  filteredEvents[index].date,
                                  filteredEvents[index].eventname,
                                  filteredEvents[index].location,
                                  filteredEvents[index].time,
                                  false);
                            },
                          ),
                          filteredPost.isNotEmpty
                              ? _buildSectionTitle('Latest Posts')
                              : SizedBox(),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: filteredPost.length,
                            itemBuilder: (context, index) {
                              return _buildLatestPostCard(
                                  "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",
                                  filteredPost[index].date,
                                  filteredPost[index].name,
                                  filteredPost[index].location!,
                                  false);
                            },
                          ),
                        ]),
                  ],
                ),
              ));
  }

  Widget homeBody() {
    return AppShimmerLoading(
      isLoading: isloading,
      child: Stack(
        children: [
          Opacity(
            opacity: issearch && !issearchwidgetShow ? 0.4 : 1,
            child: AbsorbPointer(
              absorbing: issearch && !issearchwidgetShow,
              child: issearchwidgetShow
                  ? isSearch()
                  : Column(
                      children: [
                        SizedBox(
                          height: 165,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    _buildSectionTitle('Popular Events'),
                                    ShimmerItem(
                                      height: 200,
                                      child: SizedBox(
                                        height: 260,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: popularEvents.length,
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) {
                                            return _buildEventCard(
                                                popularEvents[index].img,
                                                context,
                                                popularEvents[index].date,
                                                popularEvents[index].eventname,
                                                popularEvents[index].location,
                                                popularEvents[index].time,
                                                true);
                                          },
                                        ),
                                      ),
                                    ),
                                    isloading
                                        ? const SizedBox(
                                            height: 40,
                                          )
                                        : const SizedBox(),
                                    Center(
                                      child: Stack(
                                        children: [
                                          ShimmerItem(
                                            child: Container(
                                              height: 120,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  32,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(
                                                      156, 238, 238, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 10),
                                                      child: Text(
                                                        "Invite your Friends",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: Text(
                                                        "Get \$10% off for ticket",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10,
                                                              top: 15),
                                                      child: Container(
                                                        height: 30,
                                                        width: 70,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: orange,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "INVITE",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                          ),
                                          Positioned(
                                              right: 5,
                                              child: Image.asset(
                                                  "assets/icons/gift.gif"))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    latestPosts.isNotEmpty
                                        ? _buildSectionTitle('Latest Posts')
                                        : SizedBox(),
                                    isloading
                                        ? const SizedBox(
                                            height: 40,
                                          )
                                        : const SizedBox(),
                                    ShimmerItem(
                                        height: 200,
                                        child: _buildLatestPosts(context)),
                                    _buildSectionTitle('Our Proud Sponsors'),
                                    ShimmerItem(
                                      child: CarouselSlider(
                                        options: CarouselOptions(
                                          height: 100.0,
                                          autoPlay: true,
                                          aspectRatio: 16 / 9,
                                          autoPlayCurve: Curves.linear,
                                          enableInfiniteScroll: true,
                                          autoPlayInterval:
                                              const Duration(seconds: 10),
                                          autoPlayAnimationDuration:
                                              const Duration(milliseconds: 500),
                                          viewportFraction: 0.7,
                                        ),
                                        items: sponsers.map((item) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: 100,
                                              width: 230,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "https://picsum.photos/200/300",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        )
                      ],
                    ),
            ),
          ),
          ShimmerItem(
            isFitChild: true,
            child: Container(
              height: 165,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(65),
                    bottomRight: Radius.circular(65),
                  )),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 42,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        SizedBox(
                            width: 25,
                            height: 25,
                            child: Image.asset("assets/icons/search.png")),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                                color: Colors.white, decorationThickness: 0),
                            onTap: () {
                              issearch = true;
                              setState(() {});
                            },
                            controller: searchController,
                            cursorColor: Colors.white,
                            onChanged: searchEvents,
                            decoration: InputDecoration(
                              hintText: "|  Search...",
                              hintStyle: TextStyle(
                                color: Colors.white54,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 25,
                            height: 25,
                            child: Image.asset("assets/icons/mic.png")),
                        const SizedBox(width: 16),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        (issearch | issearchwidgetShow)
                            ? "Recently searches"
                            : "Hello, ${context.read<UserCubit>().state.userName}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    (issearch | issearchwidgetShow)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  height: 25,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Colors.white54,
                                      )),
                                  child: Row(
                                    children: const [
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Icon(
                                        Icons.update,
                                        color: Colors.white54,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Quindl",
                                        style: TextStyle(
                                          color: Colors.white60,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  height: 25,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Colors.white54,
                                      )),
                                  child: Row(
                                    children: const [
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Icon(
                                        Icons.update,
                                        color: Colors.white54,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Events",
                                        style: TextStyle(
                                          color: Colors.white60,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    issearchwidgetShow = false;
                                    issearch = false;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Container(
                                    height: 25,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white54,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.white54,
                                        )),
                                    child: Row(
                                      children: const [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Center(
                                          child: Icon(
                                            Icons.close,
                                            size: 15,
                                          ),
                                        ),
                                        Text(
                                          "Close search",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: Colors.red),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          )
                        : const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "welcome back, hope your feeling good today",
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                          )
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Text("See All"),
          const SizedBox(
            width: 3,
          ),
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(
                "assets/icons/arrow_right_alt_24dp_000000_FILL1_wght400_GRAD0_opsz24.png"),
          ),
        ],
      ),
    );
  }

  _buildEventCard(String imageUrl, BuildContext context, String date,
      String eventname, String location, String time, bool issearchPos) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detailviewevent(
                      img: "https://picsum.photos/200/300",
                      eventdate: date,
                      eventname: eventname,
                      eventtime: time,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(children: [
                SizedBox(
                  // width: 280 ,
                  width: issearchPos
                      ? 280
                      : MediaQuery.of(context).size.width - 32,
                  height: 230,
                  child: CachedNetworkImage(
                    imageUrl: "https://picsum.photos/200/300",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    width: issearchPos
                        ? 280
                        : MediaQuery.of(context).size.width - 32,
                    height: 230,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.4)))
              ]),
            ),
            Positioned(
              left: 13,
              child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(
                    children: [
                      Text(
                        CommonService.formateddate(date).split(" ")[0],
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        CommonService.formateddate(date).split(" ")[1],
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
            ),
            Positioned(
                left: 53,
                top: 5,
                child: Text(
                  eventname.length >= 18
                      ? "${eventname.substring(0, 17)}..."
                      : eventname,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            Positioned(
              left: 13,
              bottom: 43,
              child: Container(
                width: 135,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 3),
                      child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/icons/location.png")),
                    ),
                    Text(
                      location.length >= 12
                          ? "${location.substring(0, 12)} + ...."
                          : location,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 43,
              // right: 13,
              right: issearchPos ? 13 : 30,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: orange, width: 2)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset(
                          "assets/icons/north_east_24dp_E16811_FILL0_wght400_GRAD0_opsz24.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget _buildSponsorsCarousel() {
  //   return
  // }

  Widget _buildLatestPosts(BuildContext context) {
    return ShimmerItem(
      child: SizedBox(
        height: 280,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: latestPosts.length,
          itemBuilder: (context, index) {
            return _buildLatestPostCard(
                "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",
                latestPosts[index].date,
                latestPosts[index].name,
                latestPosts[index].location!,
                true);
          },
        ),
      ),
    );
  }

  Widget _buildLatestPostCard(String img, String date, String eventname,
      String location, bool issearchpos) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 10, right: 16),
      child: Container(
        width: 290,
        height: 280, // Set a fixed width for each card
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              // offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: img,
                    width: double.infinity,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CommonService.formatdateForEvents(date), // Example Date
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    eventname, // Example Title
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(225, 104, 17, 1),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Join Now",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
