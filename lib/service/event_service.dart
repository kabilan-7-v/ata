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
        log(jsonResponse.toString());

        for (var i in jsonResponse) {
          // if (kDebugMode) {
          //   print(emoji);

          //   print(i);
          //   print(emoji);
          // }
          
            ongoingevent.add(OnGoingEventmodels.fromJson(i));
                  }
        DateTime now = DateTime.now().toUtc();
  String todayDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

  // Filter only today's dates
   List<OnGoingEventmodels> todayDates = ongoingevent.where((dateStr) {
    DateTime date = DateTime.parse(dateStr.date).toUtc();
    String dateStrFormatted = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    return dateStrFormatted == todayDate;
  }).toList();
   todayDates.sort(
        (a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));
  return todayDates;
      } else {
        throw Exception('Failed to load events: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
   

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
            upComingEvents.add(UpcomingEventmodels.fromJson(i));
          }
        }
      } else {
        throw Exception('Failed to load events: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
    upComingEvents.sort(
        (a, b) => DateTime.parse(a.date).compareTo(DateTime.parse(b.date)));
    return upComingEvents;
  }
}
