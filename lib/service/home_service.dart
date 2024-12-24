import 'dart:convert';

import 'package:ata/models/homemodels.dart';
import 'package:ata/service/common_service.dart';

import 'package:http/http.dart' as http;

class HomeService {
  static Future<List<Popularevents>> fetchPopularevents() async {
    List<Popularevents> populareventslst = [];
    const String url = 'https://atabackend.onrender.com/events/get';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the JSON response into a list of events
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        for (var i in jsonResponse) {
          // if (kDebugMode) {
          //   print(i);
          //   print(emoji);
          // }
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
    List<Latestpost> latestpostlst = [];
    const String url = 'https://atabackend.onrender.com/blog/get';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the JSON response into a list of events

        final List<dynamic> jsonResponse = jsonDecode(response.body);

        for (var i in jsonResponse) {
          if (!CommonService.isTodayOrFuture(i["createdAt"])) {
            latestpostlst.add(Latestpost.fromJson(i));
          }
        }
        return latestpostlst;
      } else {
        throw Exception('Failed to load events: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
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
