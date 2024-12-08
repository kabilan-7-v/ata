import 'package:ata/models/homemodels.dart';
import 'package:ata/pages/Home/detailviewevent.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  static const List<String> sponser = [
    "assets/imgs/sponser1.webp",
    "assets/imgs/sponser2.webp",
    "assets/imgs/sponser3.webp",
    "assets/imgs/sponser4.webp"
  ];

  @override
  Widget build(BuildContext context) {
    int populareventslstlength =
        Provider.of<Populareventslist>(context).populareventslst.length;
    int latesteventslstlength =
        Provider.of<Latestpostlst>(context).latestpostlst.length;
    // var provider = Provider.of<Seasonlst>(context).seasons;

    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                            width: 20,
                            height: 20,
                            child: Image.asset("assets/icons/search.png")),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "|  Search...",
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset("assets/icons/mic.png")),
                        const SizedBox(width: 16),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Hello, Deepika",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
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
            // CarouselSlider.builder(
            //     itemCount: provider.length,
            //     itemBuilder: (context, ind, i) {
            //       return _buildMainBanner(
            //           provider[ind].img, provider[ind].name);
            //     },
            //     options: CarouselOptions(
            //         enlargeCenterPage: true, height: 230, autoPlay: true)),
            _buildSectionTitle('Popular Events'),
            _buildPopularEvents(context, populareventslstlength),

            Center(
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(156, 238, 238, 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              "Invite your Friends",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Get \$10% off for ticket",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text(
                                  "INVITE",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                  Positioned(
                      right: 5, child: Image.asset("assets/icons/gift.gif"))
                ],
              ),
            ),
            _buildSectionTitle('Latest Posts'),

            _buildLatestPosts(context, latesteventslstlength),
            _buildSectionTitle('Our Proud Sponsors'),
            _buildSponsorsCarousel(),
          ],
        ),
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

  Widget _buildPopularEvents(BuildContext context, len) {
    List<Popularevents> res =
        Provider.of<Populareventslist>(context).populareventslst;

    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: len,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return _buildEventCard(res[index].img, context, res[index].date,
              res[index].eventname, res[index].location);
        },
      ),
    );
  }

  Widget _buildEventCard(
      String imageUrl, BuildContext context, date, eventname, location) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detailviewevent(img: imageUrl)));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  SizedBox(
                    width: 280,
                    height: 230,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      width: 280,
                      height: 230,
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.4)))
                ],
              ),
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
                  child: const Column(
                    children: [
                      Text(
                        "Jun",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "02",
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
                  eventname,
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
                    const Text(
                      "Adelaide, 33176...",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 43,
              right: 13,
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

  Widget _buildSponsorsCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 100.0,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.linear,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 1),
        autoPlayAnimationDuration: const Duration(milliseconds: 200),
        viewportFraction: 0.5,
      ),
      items: sponser.map((item) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(item),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLatestPosts(BuildContext context, len) {
    List<Latestpost> res = Provider.of<Latestpostlst>(context).latestpostlst;
    return SizedBox(
      height: 325,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: len,
        itemBuilder: (context, index) {
          return _buildLatestPostCard(res[index].img);
        },
      ),
    );
  }

  Widget _buildLatestPostCard(String img) {
    return Container(
      width: 290, // Set a fixed width for each card
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
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
                child: Image.asset(
                  img,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 150,
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
                const Text(
                  "22 July 2024", // Example Date
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Birds Day", // Example Title
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 16),
                    SizedBox(width: 4),
                    Text("Adilaide, 33176"), // Example Location
                  ],
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(225, 104, 17, 1),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Join Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
