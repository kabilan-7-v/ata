import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          backgroundColor: orange,
          title: const Text(
            'Tortoise and the Hare',
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  storydes,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/imgs/tortoise1.webp"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  storydes1,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/imgs/tortoise.webp"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  storydes2,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/imgs/tortoise2.webp"),
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ));
  }
}
