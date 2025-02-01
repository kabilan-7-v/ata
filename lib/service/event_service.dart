// import 'dart:convert';

import 'dart:convert';
import 'dart:developer';

import 'package:ata/models/eventmodels.dart';
import 'package:ata/service/common_service.dart';
import 'package:ata/widget/const.dart';

import 'package:http/http.dart' as http;

class EventService {
  static Future<List<OnGoingEventmodels>> fetchOngoingEvents() async {
    List<OnGoingEventmodels> ongoingevent = [];
    String url = '$renderurl/events/get';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the JSON response into a list of events

        final List<dynamic> jsonResponse = jsonDecode(response.body);

        for (var i in jsonResponse) {
          // if (kDebugMode) {
          //   print(emoji);

          //   print(i);
          //   print(emoji);
          // }
          if (!CommonService.isTodayOrFuture(i["date"])) {
            ongoingevent.add(OnGoingEventmodels.fromJson(i));
          }
        }
      } else {
        throw Exception('Failed to load events: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }

    return ongoingevent;
  }

  static Future<List<UpcomingEventmodels>> fetchUpcomingEvents() async {
    List<UpcomingEventmodels> upComingEvents = [];
    String url = '$renderurl/events/get';
    try {
      final response = await http.get(Uri.parse(url));
      // print(emoji);

      if (response.statusCode == 200) {
        // Parse the JSON response into a list of events

        final List<dynamic> jsonResponse = jsonDecode(response.body);

        for (var i in jsonResponse) {
          // if (kDebugMode) {
          //   print(emoji);

          //   print(i);
          //   print(emoji);
          // }
          if (CommonService.isTodayOrFuture(i["date"])) {
            log(i["date"]);

            upComingEvents.add(UpcomingEventmodels.fromJson(i));
          }
        }
      } else {
        throw Exception('Failed to load events: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }

    return upComingEvents;
  }
}
