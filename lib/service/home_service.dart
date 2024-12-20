import 'dart:convert';

import 'package:ata/models/homemodels.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeService {
  static String formateddate(timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);

    String formattedDate = DateFormat('MMM dd').format(dateTime);
    return formattedDate;
    // Output: Dec 31
  }

  static Future<List<Popularevents>> fetchPopularevents() async {
    List<Popularevents> populareventslst = [];
    const String url = 'https://atabackend.onrender.com/events/get';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the JSON response into a list of events
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        for (var i in jsonResponse) {
          if (kDebugMode) {
            print(i);
            print(emoji);
          }
          populareventslst.add(Popularevents.fromJson(i));
        }
      } else {
        throw Exception('Failed to load events: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }

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
