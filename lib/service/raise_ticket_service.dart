import 'dart:convert';

import 'package:ata/cubit/usercubit.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

Future<List<dynamic>> getmembership(BuildContext context) async {
  String url = '$renderurl/supportdesk/get/';

  try {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of events
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);

      return jsonResponse;
    } else {
      throw Exception('Failed to load events: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

Future<bool> raisedticket(
    String issuse, BuildContext context, String issuetittle) async {
  // Define the URL
  String url = '$renderurl/supportdesk/add/';

  try {
    // Make the POST request
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "name": context.read<UserCubit>().state.firstname+context.read<UserCubit>().state.lastname,
        "email": context.read<UserCubit>().state.email,
        "countryCode": "+91",
        "phone": context.read<UserCubit>().state.phno,
        "issueTitle": issuetittle,
        "issueDescription": issuse
      }),
    );
    // Check the response status
    if (response.statusCode == 201) {
      print(response.body);
      log("ticket raised succesfully");

      return true;
      // Parse the response if successful
    }
  } catch (e) {
    // Handle exceptions
    if (kDebugMode) {
      print('Error: $e');
    }
  }
  return false;
}
