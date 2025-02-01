import 'dart:convert';
import 'dart:developer';

import 'package:ata/widget/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future membershipdetailsfetch(BuildContext context) async {
  // Define the URL
  String url = '$renderurl/membership/get';
  try {
    // Make the POST request
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        // 'email': context.read<UserCubit>().state.email
        // 'email': "test@four.com",
        'email': "test@seven.com",


      }),
    );
    log(emoji);
    // Check the response status
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      log(jsonResponse["membership"][0]["userId"].toString());

      // Parse the response if successful
      return [
        jsonResponse["membership"][0]["userId"].toString(),
        jsonResponse["membership"][0]["membershipName"].toString()
      ];
    } else {
      return ["Single", ""];
    }
  } catch (e) {
    // Handle exceptions
    if (kDebugMode) {
      print('Error: $e');
    }
  }
  return ["Single", ""];
}

Future<List<dynamic>> membershipdetailsfamily(
    BuildContext context, String id) async {
  // Define the URL
  String url = '$renderurl/membership/dependents/$id';
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
      // Parse the JSON response into a list of events
    } else {
      return [];
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
