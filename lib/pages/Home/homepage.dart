// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:ata/cubit/usercubit.dart';
import 'package:ata/models/homemodels.dart';
import 'package:ata/pages/Blog/blog_page.dart';
import 'package:ata/pages/Home/detailviewevent.dart';
import 'package:ata/pages/Internet/no_internet_page.dart';
import 'package:ata/service/common_service.dart';
import 'package:ata/service/home_service.dart';
import 'package:ata/service/login.dart';
import 'package:ata/widget/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:permission_handler/permission_handler.dart';
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
  List<String> recentsearch = [];
  bool connect_internet = false;

  @override
  void initState() {
    setUserDetails(context);
    get_internet();
    getHomeData();
    setState(() {});

    super.initState();
  }

  get_internet() async {
    bool isConnected = await InternetConnection().hasInternetAccess;
    if (!isConnected) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => NoInternetPage()),
          (e) => false);
    }
  }

  getHomeData() async {
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
    latestPosts = await HomeService.fetchLatestPost();
    sponsers = await HomeService.fetchSponsers();
    popularEvents = await HomeService.fetchPopularevents();
    recentsearch = await HomeService.getreacentsearch(context);
    Future.delayed(Durations.long4);
    if (!mounted) return;
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
      if (!mounted) return;
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
        searchController.clear();
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
                          filteredEvents.isNotEmpty
                              ? _buildSectionTitle('Popular Events')
                              : SizedBox(),
                          filteredEvents.isNotEmpty
                              ? ListView.builder(
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
                                      false,
                                      filteredEvents[index].description,
                                      popularEvents[index].manageThrough,
                                      index,
                                    );
                                  },
                                )
                              : SizedBox(),
                          filteredPost.isNotEmpty
                              ? _buildSectionTitle('Latest Posts')
                              : SizedBox(),
                          filteredPost.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: filteredPost.length,
                                  itemBuilder: (context, index) {
                                    return _buildLatestPostCard(
                                        filteredPost[index].img,
                                        filteredPost[index].date,
                                        filteredPost[index].name,
                                        filteredPost[index].location!,
                                        false,
                                        filteredPost[index].desc!);
                                  },
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 60,
                          )
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
                                    isloading
                                        ? _buildSectionTitle('Popular Events')
                                        : popularEvents.isEmpty
                                            ? SizedBox()
                                            : _buildSectionTitle(
                                                'Popular Events'),
                                    isloading
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  32,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                    popularEvents.isEmpty
                                        ? SizedBox()
                                        : SizedBox(
                                            height: 245,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: popularEvents.length,
                                              padding: EdgeInsets.zero,
                                              itemBuilder: (context, index) {
                                                return _buildEventCard(
                                                  popularEvents[index].img,
                                                  context,
                                                  popularEvents[index].date,
                                                  popularEvents[index]
                                                      .eventname,
                                                  popularEvents[index].location,
                                                  popularEvents[index].time,
                                                  true,
                                                  popularEvents[index]
                                                      .description,
                                                  popularEvents[index]
                                                      .manageThrough,
                                                  index,
                                                );
                                              },
                                            ),
                                          ),
                                    isloading
                                        ? const SizedBox(
                                            height: 16,
                                          )
                                        : const SizedBox(),
                                    filteredEvents.isEmpty
                                        ? SizedBox(
                                            height: 16,
                                          )
                                        : SizedBox(),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: Stack(
                                        children: [
                                          ShimmerItem(
                                            isFitChild: true,
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
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10, top: 8),
                                                      child: InkWell(
                                                        onTap: () {
                                                          CommonService.launchurl(
                                                              "https://adelaidetamil.com.au/");
                                                        },
                                                        child: Container(
                                                          height: 30,
                                                          width: 70,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: orange,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
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
                                    isloading
                                        ? _buildSectionTitle('Latest Posts')
                                        : latestPosts.isNotEmpty
                                            ? _buildSectionTitle('Latest Posts')
                                            : SizedBox(),
                                    isloading
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  32,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                    isloading
                                        ? const SizedBox(
                                            height: 40,
                                          )
                                        : const SizedBox(),
                                    latestPosts.length == 1
                                        ? ShimmerItem(
                                            isFitChild: true,
                                            child: Row(children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0),
                                                child: _buildLatestPostCard(
                                                    latestPosts[0].img,
                                                    latestPosts[0].date,
                                                    latestPosts[0].name,
                                                    latestPosts[0].location!,
                                                    true,
                                                    latestPosts[0].desc!),
                                              )
                                            ]),
                                          )
                                        : latestPosts.isNotEmpty
                                            ? _buildLatestPosts(context)
                                            : SizedBox(),
                                    _buildSectionTitle('Our Proud Sponsors'),
                                    isloading
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  32,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                    sponsers.isEmpty
                                        ? SizedBox()
                                        : ShimmerItem(
                                            isFitChild: true,
                                            child: CarouselSlider.builder(
                                              options: CarouselOptions(
                                                height: 100.0,
                                                autoPlay: true,
                                                aspectRatio: 16 / 9,
                                                autoPlayCurve: Curves.linear,
                                                enableInfiniteScroll: true,
                                                autoPlayInterval:
                                                    const Duration(seconds: 10),
                                                autoPlayAnimationDuration:
                                                    const Duration(
                                                        milliseconds: 500),
                                                viewportFraction: 0.7,
                                              ),
                                              itemCount: sponsers.length,
                                              itemBuilder: (context, ind, i) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                    height: 100,
                                                    width: 230,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            "$renderurl/uploads/${sponsers[ind].img}",
                                                        fit: BoxFit.cover,
                                                        placeholder:
                                                            (context, url) {
                                                          return Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          );
                                                        },
                                                        errorWidget: (context,
                                                            url, error) {
                                                          return Image.network(
                                                            "https://picsum.photos/200/300",
                                                            fit: BoxFit.cover,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
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
                            onSubmitted: (value) async {
                              await HomeService.storerecentsearch(
                                  value, context);
                              recentsearch =
                                  await HomeService.getreacentsearch(context);
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
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        (issearch | issearchwidgetShow)
                            ? "Recently searches"
                            : "Hello, ${context.watch<UserCubit>().state.firstname+context.watch<UserCubit>().state.lastname}",
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
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              recentsearch.length >= 2
                                  ? SizedBox(
                                      height: 25,
                                      width: MediaQuery.of(context).size.width -
                                          44,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: recentsearch.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, ind) {
                                            return GestureDetector(
                                              onTap: () {
                                                searchController.text =
                                                    recentsearch[
                                                        recentsearch.length -
                                                            (ind + 1)];
                                                searchEvents(recentsearch[
                                                    recentsearch.length -
                                                        (ind + 1)]);

                                                setState(() {});
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Container(
                                                  height: 25,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                        color: Colors.white54,
                                                      )),
                                                  child: Row(
                                                    children: [
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
                                                        recentsearch[recentsearch
                                                                            .length -
                                                                        (ind +
                                                                            1)]
                                                                    .length >
                                                                6
                                                            ? "${recentsearch[recentsearch.length - (ind + 1)].substring(0, 6)}..."
                                                            : recentsearch[
                                                                recentsearch
                                                                        .length -
                                                                    (ind + 1)],
                                                        style: TextStyle(
                                                          color: Colors.white60,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    )
                                  : recentsearch.length == 1
                                      ? SizedBox(
                                          height: 25,
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: 1,
                                              reverse: true,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, ind) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    searchController.text =
                                                        recentsearch[
                                                            recentsearch
                                                                    .length -
                                                                (ind + 1)];
                                                    searchEvents(recentsearch[
                                                        recentsearch.length -
                                                            (ind + 1)]);

                                                    setState(() {});
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child: Container(
                                                      height: 25,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                            color:
                                                                Colors.white54,
                                                          )),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 2,
                                                          ),
                                                          Icon(
                                                            Icons.update,
                                                            color:
                                                                Colors.white54,
                                                            size: 20,
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            recentsearch[recentsearch.length -
                                                                            (ind +
                                                                                1)]
                                                                        .length >
                                                                    6
                                                                ? "${recentsearch[recentsearch.length - (ind + 1)].substring(0, 6)}..."
                                                                : recentsearch[
                                                                    recentsearch
                                                                            .length -
                                                                        (ind +
                                                                            1)],
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .white60,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        )
                                      : SizedBox(),

                              // Spacer(),
                              // InkWell(
                              //   onTap: () {
                              //     searchController.clear();

                              //     setState(() {
                              //       issearchwidgetShow = false;
                              //       issearch = false;
                              //     });
                              //   },
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(left: 15),
                              //     child: Container(
                              //       height: 25,
                              //       width: 100,
                              //       decoration: BoxDecoration(
                              //           color: Colors.white54,
                              //           borderRadius: BorderRadius.circular(5),
                              //           border: Border.all(
                              //             color: Colors.white54,
                              //           )),
                              //       child: Row(
                              //         children: const [
                              //           SizedBox(
                              //             width: 5,
                              //           ),
                              //           Center(
                              //             child: Icon(
                              //               Icons.close,
                              //               size: 15,
                              //             ),
                              //           ),
                              //           Text(
                              //             "Close search",
                              //             style: TextStyle(
                              //                 fontWeight: FontWeight.bold,
                              //                 fontSize: 10,
                              //                 color: Colors.red),
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                width: 30,
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
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  _buildEventCard(
      String imageUrl,
      BuildContext context,
      String date,
      String eventname,
      String location,
      String time,
      bool issearchPos,
      String desc,
      String managethrough,
      int ind) {
    return InkWell(
      onTap: () async {
        await HomeService.storerecentsearch(eventname, context);
        recentsearch = await HomeService.getreacentsearch(context);
        setState(() {});
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detailviewevent(
                      img: imageUrl,
                      eventdate: date,
                      eventname: eventname,
                      eventtime: time,
                      location: location,
                      des: desc,
                      manageThrough: managethrough,
                    )));
      },
      child: Padding(
        padding: ind + 1 == popularEvents.length
            ? const EdgeInsets.only(left: 16, bottom: 0, top: 5, right: 16)
            : const EdgeInsets.only(left: 16, bottom: 0, top: 5, right: 10),
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
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Image.network(
                        "https://picsum.photos/200/300",
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Container(
                    width: issearchPos
                        ? 280
                        : MediaQuery.of(context).size.width - 32,
                    height: 230,
                    decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4)))
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
    return AppShimmerLoading(
      isLoading: isloading,
      child: ShimmerItem(
        isFitChild: true,
        child: SizedBox(
          height: 280,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: latestPosts.length,
            itemBuilder: (context, index) {
              log(latestPosts[index].img);

              return _buildLatestPostCard(
                  latestPosts[index].date,
                  latestPosts[index].date,
                  latestPosts[index].name,
                  latestPosts[index].location!,
                  true,
                  latestPosts[index].desc!);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLatestPostCard(String img, String date, String eventname,
      String location, bool issearchpos, String desc) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 10, right: 16),
      child: Container(
        width: 290,
        height: 265, // Set a fixed width for each card
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
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
                    imageUrl: "$renderurl/uploads/$img",
                    width: double.infinity,
                    height: 130,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Image.network(
                        "https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI",
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Container(
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlogPage(
                                      img: "$renderurl/uploads$img",
                                      title: eventname,
                                      desc: desc,
                                      date: date,
                                    )));
                      },
                      child: const Text(
                        "View Post",
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
