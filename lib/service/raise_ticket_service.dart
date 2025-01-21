import 'dart:convert';

import 'package:ata/widget/const.dart';
import 'package:ata/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> raisetikect(BuildContext context) async {
  String url = '$renderurl/supportdesk/get/';

  try {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of events
      final List<dynamic> jsonResponse = jsonDecode(response.body);

      return jsonResponse;
    } else {
      throw Exception('Failed to load events: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
