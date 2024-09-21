import 'package:flutter/material.dart';

class Aboutuspage extends StatelessWidget {
  const Aboutuspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              "About us",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset("assets/imgs/Group 2610422.png"),
        const Center(
          child: Text(
            "Adelaide Tamil Association",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
              "Adelaide Tamil Association (ATA) is a non-profit, cultural organization serving the Adelaide Tamil community and will strive to maintain tamil culture, educational and community activities."),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
              "Membership of the Adelaide Tamil Association is open to South Australians who have a keen interest and desire to foster the Tamil Culture, language and social interaction with other Tamils here in South Australia."),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "Read More ...",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        )
      ]),
    );
  }
}
