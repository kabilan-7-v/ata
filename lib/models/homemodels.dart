import 'package:flutter/material.dart';

class Season extends ChangeNotifier {
  final String img;
  final String name;

  Season({required this.img, required this.name});
}

class Seasonlst extends ChangeNotifier {
  List<Season> seasons = [
    Season(img: 'assets/imgs/Variant3.png', name: 'பாலை'),
    Season(img: 'assets/imgs/Variant4.png', name: 'மருதம்'),
    Season(img: 'assets/imgs/Variant5.png', name: 'குறிஞ்சி'),
  ];
}

class Popularevents extends ChangeNotifier {
  final String date;
  final String eventname;
  final String location;
  final String img;

  Popularevents(
      {required this.date,
      required this.eventname,
      required this.location,
      required this.img});
}

class Populareventslist extends ChangeNotifier {
  List<Popularevents> populareventslst = [
    Popularevents(
      date: "20th July,2024",
      eventname: "Yoga Day",
      location: "Adelaide, 33176",
      img: "assets/imgs/Rectangle 3904 (7).png",
    ),
    Popularevents(
        date: "20th July,2024",
        eventname: "Foodie Callo",
        location: "Adelaide, 33176",
        img: "assets/imgs/Rectangle 3905.png"),
    Popularevents(
      date: "20th July,2024",
      eventname: "Foodie Callo",
      location: "Adelaide, 33176",
      img: "assets/imgs/Rectangle 3904 (8).png",
    ),
    Popularevents(
      date: "20th July,2024",
      eventname: "eventname",
      location: "Adelaide, 33176",
      img: "assets/imgs/Rectangle 3904 (9).png",
    ),
  ];
}

class Latestpost extends ChangeNotifier {
  final String title;
  final String subtitle;
  final String img;

  Latestpost({required this.title, required this.subtitle, required this.img});
}

class Latestpostlst extends ChangeNotifier {
  static const List<String> latestPost = [];
  List<Latestpost> latestpostlst = [
    Latestpost(
        img: "assets/imgs/latestpost3.png",
        title: "title",
        subtitle: "subtitle"),
    Latestpost(
        img: "assets/imgs/lastest4.png", title: "title", subtitle: "subtitle"),
    Latestpost(
        img: "assets/imgs/lastest5.png", title: "title", subtitle: "subtitle"),
    Latestpost(
        img: "assets/imgs/lastestpost6.png",
        title: "title",
        subtitle: "subtitle"),
  ];
}
