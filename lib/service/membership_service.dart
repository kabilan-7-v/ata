import 'dart:convert';

import 'package:ata/widget/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

Future<bool> membershipdetailsfetch(BuildContext context) async {
  // Define the URL
  String url = '$renderurl/membership/get/';
  try {
    // Make the POST request
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': 'test@four.com'
        // 'email': context.read<UserCubit>().state.email,
      }),
    );

    // Check the response status
    if (response.statusCode == 200) {
      // Parse the response if successful
      final data = jsonDecode(response.body);
      log(data.toString());
    }
  } catch (e) {
    // Handle exceptions
    if (kDebugMode) {
      print('Error: $e');
    }
  }
  return false;
}
