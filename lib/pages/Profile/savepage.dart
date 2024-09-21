import 'package:flutter/material.dart';

class Savepage extends StatelessWidget {
  const Savepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 22,
                    )),
                const Text(
                  'Saved',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
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
      padding: const EdgeInsets.all(12.0),
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
          SizedBox(
              height: 250,
              width: 300,
              child: Image.asset(
                postimg,
                fit: BoxFit.contain,
              )),
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
              const Icon(Icons.bookmark)
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
