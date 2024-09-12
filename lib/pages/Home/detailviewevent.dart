import 'package:flutter/material.dart';

class Detailviewevent extends StatelessWidget {
  const Detailviewevent({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                size: 18,
              )),
          buildMainBanner(img)
        ],
      ),
    );
  }

  Widget buildMainBanner(img) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(img),
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
}
