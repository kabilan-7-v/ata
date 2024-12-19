// import 'dart:convert';

import 'package:ata/models/eventmodels.dart';

class EventService {
  static get http => null;

  static Future<List<OnGoingEventmodels>> fetchOngoingEvents() async {
    List<OnGoingEventmodels> ongoingevent = [
      OnGoingEventmodels(
          date: "22 July 2024",
          time: "4.00 PM",
          eventname: "Birds Day",
          location: "Adilaide, 33176",
          description:
              "The performance maybe by a single musician sometimes such as an Archestra,chair or band",
          image: "assets/ongoing_event/ATA Event4 (1).png",
          isselected: true),
      OnGoingEventmodels(
          date: "22 July 2024",
          time: "4.00 PM",
          eventname: "Birds Day",
          location: "Adilaide, 33176",
          description:
              "The performance maybe by a single musician sometimes such as an Archestra,chair or band",
          image: "assets/ongoing_event/ATA Event1 (3).jpg",
          isselected: true),
      OnGoingEventmodels(
          date: "22 July 2024",
          time: "4.00 PM",
          eventname: "Birds Day",
          location: "Adilaide, 33176",
          description:
              "The performance maybe by a single musician sometimes such as an Archestra,chair or band",
          image: "assets/ongoing_event/ATA Event2 (1).jpg",
          isselected: true),
      OnGoingEventmodels(
          date: "22 July 2024",
          time: "4.00 PM",
          eventname: "Birds Day",
          location: "Adilaide, 33176",
          description:
              "The performance maybe by a single musician sometimes such as an Archestra,chair or band",
          image: "assets/ongoing_event/ATA Event4.png",
          isselected: true),
    ];
    return ongoingevent;
  }

  static Future<List<UpcomingEventmodels>> fetchUpcomingEvents() async {
    List<UpcomingEventmodels> upComingEvents = [
      UpcomingEventmodels(
          date: "22 July 2024",
          time: "4.00 PM",
          eventname: "Birds Day",
          location: "Adilaide, 33176",
          description:
              "The performance maybe by a single musician sometimes such as an Archestra,chair or band",
          image: "assets/upcoming_event/ATA Upcoming1.png",
          isselected: true),
      UpcomingEventmodels(
          date: "22 July 2024",
          time: "4.00 PM",
          eventname: "Birds Day",
          location: "Adilaide, 33176",
          description:
              "The performance maybe by a single musician sometimes such as an Archestra,chair or band",
          image: "assets/upcoming_event/ATA Upcoming2.png",
          isselected: true),
      UpcomingEventmodels(
          date: "22 July 2024",
          time: "4.00 PM",
          eventname: "Birds Day",
          location: "Adilaide, 33176",
          description:
              "The performance maybe by a single musician sometimes such as an Archestra,chair or band",
          image: "assets/upcoming_event/ATA Upcoming3.jpg",
          isselected: true),
      UpcomingEventmodels(
          date: "22 July 2024",
          time: "4.00 PM",
          eventname: "Birds Day",
          location: "Adilaide, 33176",
          description:
              "The performance maybe by a single musician sometimes such as an Archestra,chair or band",
          image: "assets/upcoming_event/ATA Upcoming4.png",
          isselected: true),
    ];

    return upComingEvents;
  }
}
