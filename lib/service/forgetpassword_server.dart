import 'dart:convert';

import 'package:ata/cubit/usercubit.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

Future<bool> forgetpassword(String email) async {
  // Define the URL
  String url = '$renderurl/auth/send-reset-email';

  try {
    // Make the POST request
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
      }),
    );
    print(email);
    // Check the response status
    if (response.statusCode == 200) {
      // Parse the response if successful

      // if (kDebugMode) {
      //   print(data);
      //   print(emoji);
      //   print(data["user"]);
      // }
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
    }
  }
  return false;
}

Future<bool> passwordandsecurity(
    String currenpass, BuildContext context, String newpass) async {
  // Define the URL
  String url = '$renderurl/auth/change-password';

  try {
    // Make the POST request
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        // 'email': context.read<UserCubit>().state.email,
        // "currentPassword": currenpass,
        // "newPassword": newpass
        "email": "Kabilan@gmail.com",
        "currentPassword": "Kabi@1234",
        "newPassword": "Kabi@12345"
      }),
    );
    // Check the response status
    if (response.statusCode == 200) {
      // Parse the response if successful

      if (kDebugMode) {
        print(response.body);
        print(emoji);
      }
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
    }
  }
  return false;
}
