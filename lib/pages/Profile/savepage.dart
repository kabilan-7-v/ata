import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class Savepage extends StatelessWidget {
  const Savepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        backgroundColor: ataBackgroundcolor,
        title: const Text(
          'Saved',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customcontainerpost("assets/imgs/Ellipse 553.png", "Hendry Know",
                "2hr", "assets/imgs/dog.png"),
            customcontainerpost("assets/imgs/Ellipse 551.png", "Karishma",
                "2hr", "assets/imgs/temple.png"),
          ],
        ),
      ),
    );
  }

  Widget customcontainerpost(profileimg, name, time, postimg) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(profileimg),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.access_time,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        time,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: SizedBox(
                height: 320,
                width: double.infinity,
                child: Image.asset(
                  postimg,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.favorite_border),
              ),
              Image.asset("assets/imgs/maps_ugc (1).png"),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.send),
              ),
              const Icon(Icons.bookmark_outline)
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
