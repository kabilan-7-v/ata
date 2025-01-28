import 'package:ata/service/common_service.dart';
import 'package:ata/widget/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Detailviewevent extends StatelessWidget {
  const Detailviewevent(
      {super.key,
      required this.img,
      required this.eventname,
      required this.eventdate,
      required this.eventtime,
      required this.des,
      required this.location,
      required this.manageThrough});
  final String img;
  final String eventname;
  final String eventdate;
  final String eventtime;
  final String des;
  final String location;
  final String manageThrough;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ataBackgroundcolor,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              size: 18,
            )),
      ),
      backgroundColor: ataBackgroundcolor,
      // bottomNavigationBar: Container(
      //   height: 80,
      //   decoration: BoxDecoration(
      //       border: Border.all(
      //         color: const Color.fromRGBO(249, 225, 207, 1),
      //         width: 5,
      //       ),
      //       borderRadius: const BorderRadius.only(
      //           topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      //   child: Row(
      //     children: [
      //       const Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           SizedBox(
      //             height: 15,
      //           ),
      //           Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 10),
      //             child: Text("Total Price"),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 10),
      //             child: Row(
      //               children: [
      //                 Text(
      //                   "\$30.00",
      //                   style: TextStyle(
      //                       color: Color.fromRGBO(225, 104, 17, 1),
      //                       fontWeight: FontWeight.bold),
      //                 ),
      //                 Text("/person")
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //       const Spacer(),
      //       ElevatedButton(
      //         style: ElevatedButton.styleFrom(
      //           backgroundColor: const Color.fromRGBO(225, 104, 17, 1),
      //         ),
      //         onPressed: () {},
      //         child:
      //             const Text("Book Now", style: TextStyle(color: Colors.white)),
      //       ),
      //       const SizedBox(
      //         width: 20,
      //       )
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMainBanner(img),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                eventname,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      Text(location.length <= 15
                          ? location
                          : location.substring(0, 15) + "..."),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Row(
                    children: [
                      const Icon(Icons.timer_outlined),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(CommonService.formatToCustomDate(eventdate) +
                          "," +
                          eventtime),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Additional Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(des),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                "Organizer",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                manageThrough,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Organizer Team"),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMainBanner(
    img,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: img,
                fit: BoxFit.cover,
              ))),
    );
  }
}
