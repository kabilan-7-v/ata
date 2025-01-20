import 'package:ata/service/common_service.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class Aboutuspage extends StatelessWidget {
  const Aboutuspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: ataBackgroundcolor,
        title: const Text(
          'About us',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.asset("assets/imgs/Group 2610422.png"),
        SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            "Adelaide Tamil Association",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
              textAlign: TextAlign.justify,
              "Adelaide Tamil Association (ATA) is a non-profit, cultural organization serving the Adelaide Tamil community and will strive to maintain tamil culture, educational and community activities."),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
              textAlign: TextAlign.justify,
              "Membership of the Adelaide Tamil Association is open to South Australians who have a keen interest and desire to foster the Tamil Culture, language and social interaction with other Tamils here in South Australia."),
        ),
        InkWell(
          onTap: () {
            CommonService.launchurl(aboutusurl);
          },
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Read More ...",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
