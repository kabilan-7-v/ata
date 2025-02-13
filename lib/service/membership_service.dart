import 'dart:convert';
import 'dart:developer';

import 'package:ata/widget/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future membershipdetailsfetch(BuildContext context, String email) async {
  // Define the URL
  log(emoji);
  log(email);
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
        'email': email,
        // 'email': "test@seven.com",
      }),
    );
    log(emoji);
    // Check the response status
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      log(jsonResponse["membership"][0]["userId"].toString());

      // Parse the response if successful
      SharedPreferences pres = await SharedPreferences.getInstance();

      pres.setStringList("memberships", [
        jsonResponse["membership"][0]["userId"].toString(),
        jsonResponse["membership"][0]["membershipName"].toString()
      ]);

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
}

Future<List<String>> membershipdetailsfamily(
    BuildContext context, String id) async {
  // Define the URL
  String url = '$renderurl/membership/dependents/$id';
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      List<String> lst = [];
      if (jsonResponse[0]["spouse"] != null) {
        lst.add(
            "${jsonResponse[0]["spouse"]["name"]}&#&${jsonResponse[0]["spouse"]["age"]}&#&Spouse");
      }

      for (var i in jsonResponse[0]["children"]) {
        lst.add("${i["name"]}&#&${i["age"]}&#&Children");
      }

      log(jsonResponse[0]["children"].toString());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('listoffamily', lst);
      return lst;
      // Parse the JSON response into a list of events
    } else {
      return [];
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
