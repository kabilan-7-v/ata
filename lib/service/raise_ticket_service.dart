import 'dart:convert';

import 'package:ata/widget/const.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> raisetikect() async {
  String url = '$renderurl/supportdesk/get/';

  try {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of events
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      print(response.statusCode);
      return jsonResponse;
    } else {
      throw Exception('Failed to load events: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
