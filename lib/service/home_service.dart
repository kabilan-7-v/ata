import 'package:ata/models/homemodels.dart';

class HomeService {
  static Future<List<Popularevents>> fetchPopularevents() async {
  
    List<Popularevents> populareventslst = [
      Popularevents(
        date: "20th July,2024",
        eventname: "Yoga Day",
        location: "Adelaide, 33176",
        img: "assets/popular_event/Rectangle 3904 (7).png",
      ),
      Popularevents(
          date: "20th July,2024",
          eventname: "Foodie Callo",
          location: "Adelaide, 33176",
          img: "assets/popular_event/Rectangle 3905.png"),
      Popularevents(
        date: "20th July,2024",
        eventname: "Foodie Callo",
        location: "Adelaide, 33176",
        img: "assets/popular_event/Rectangle 3904 (8).png",
      ),
      Popularevents(
        date: "20th July,2024",
        eventname: "eventname",
        location: "Adelaide, 33176",
        img: "assets/popular_event/Rectangle 3904 (9).png",
      ),
    ];
    return populareventslst;
  }

  static Future<List<Latestpost>> fetchLatestPost() async {
    List<Latestpost> latestpostlst = [
      Latestpost(
          img: "assets/latest_post/latestpost3.png",
          title: "title",
          subtitle: "subtitle"),
      Latestpost(
          img: "assets/latest_post/lastest4.png",
          title: "title",
          subtitle: "subtitle"),
      Latestpost(
          img: "assets/latest_post/lastest5.png",
          title: "title",
          subtitle: "subtitle"),
      Latestpost(
          img: "assets/latest_post/lastestpost6.png",
          title: "title",
          subtitle: "subtitle"),
    ];
    return latestpostlst;
  }

  static Future<List<Sponsers>> fetchSponsers() async {
    List<Sponsers> sponser = [
      Sponsers(
        img: "assets/sponser/sponser1.webp",
      ),
      Sponsers(
        img: "assets/sponser/sponser2.webp",
      ),
      Sponsers(
        img: "assets/sponser/sponser3.webp",
      ),
      Sponsers(img: "assets/sponser/sponser4.webp")
    ];
    return sponser;
  }
}
