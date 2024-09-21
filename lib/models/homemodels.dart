import 'package:flutter/material.dart';

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
      date: "date",
      eventname: "eventname",
      location: "location",
      img: "assets/imgs/Rectangle 3904 (7).png",
    ),
    Popularevents(
      date: "date",
      eventname: "eventname",
      location: "location",
      img: "assets/imgs/Rectangle 3904 (8).png",
    ),
    Popularevents(
      date: "date",
      eventname: "eventname",
      location: "location",
      img: "assets/imgs/Rectangle 3904 (9).png",
    ),
    Popularevents(
        date: "date",
        eventname: "eventname",
        location: "location",
        img: "assets/imgs/Rectangle 3905.png"),
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
