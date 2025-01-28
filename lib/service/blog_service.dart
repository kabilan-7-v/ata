import 'dart:convert';

import 'package:ata/models/homemodels.dart';
import 'package:ata/widget/const.dart';
import 'package:http/http.dart' as http;

Future<List<Latestpost>> fetchAllBlog() async {
  List<Latestpost> latestpostlst = [];
  String url = '$renderurl/blog/get';
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of events

      final List<dynamic> jsonResponse = jsonDecode(response.body);

      for (var i in jsonResponse) {
        latestpostlst.add(Latestpost.fromJson(i));
      }
      return latestpostlst;
    } else {
      throw Exception('Failed to load events: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
