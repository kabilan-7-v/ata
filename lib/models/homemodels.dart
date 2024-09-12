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
