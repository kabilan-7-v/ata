import 'package:flutter/material.dart';

class Membership extends StatelessWidget {
  const Membership({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CarouselView(
            itemExtent: 2,
            backgroundColor: Colors.amber,
            children: [Image.asset("assets/imgs/Rectangle 3904 (1).png")])
      ],
    ));
  }
}
