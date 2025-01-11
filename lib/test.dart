import 'dart:convert';

import 'package:ata/widget/const.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<bool> testcreateAccount(
  String name,
  String email,
  String password,
) async {
  // Define the URL
  String url = 'http://10.0.2.2:2000/api/createaccount/';

  try {
    // Make the POST request
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    // Check the response status
    if (response.statusCode == 201) {
      // Parse the response if successful
      print(emoji);
      final data = jsonDecode(response.body);
      print(data);

      return true;
    } else {
      // Handle error response
      if (kDebugMode) {
        print('Error: ${response.statusCode}, ${response.body}');
      }
    }
  } catch (e) {
    // Handle exceptions

    if (kDebugMode) {
      print('Error: $e');
      print(emoji);
    }
  }
  return false;
}
