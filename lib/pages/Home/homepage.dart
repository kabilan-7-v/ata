import 'package:ata/models/homemodels.dart';
import 'package:ata/pages/Home/detailviewevent.dart';
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: Center(child: Image.asset("assets/icons/Group 2610318.png")),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainBanner(),
            _buildSectionTitle('Popular Events'),
            _buildPopularEvents(context, populareventslstlength),
            _buildSectionTitle('Our Proud Sponsors'),
            _buildSponsorsCarousel(),
            const Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Latest Post",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.more_horiz),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            _buildLatestPosts(context, latesteventslstlength),
          ],
        ),
      ),
    );
  }

  Widget _buildMainBanner() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage('assets/imgs/Variant4.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: const Text(
              'குறிஞ்சி',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        ],
      ),
    );
  }

  Widget _buildPopularEvents(BuildContext context, len) {
    List<Popularevents> res =
        Provider.of<Populareventslist>(context).populareventslst;

    return SizedBox(
      height: 380,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: len,
        itemBuilder: (context, index) {
          return _buildEventCard(res[index].img, context);
        },
      ),
    );
  }

  Widget _buildEventCard(String imageUrl, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detailviewevent(img: imageUrl)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imageUrl,
                    width: 280,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("22 July 2024"),
                    Text("Birds Day",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text("Adilaide, 33176"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(225, 104, 17, 1),
                ),
                onPressed: () {},
                child: const Text("Join Now",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
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
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
              img,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
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
