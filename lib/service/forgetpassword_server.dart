import 'dart:convert';

import 'package:ata/Authentication/signin_page.dart';
import 'package:ata/cubit/usercubit.dart';
import 'package:ata/widget/const.dart';
import 'package:ata/widget/snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
        'email': context.read<UserCubit>().state.email.trim(),
        "currentPassword": currenpass,
        "newPassword": newpass
        // "email": "Kabilan@gmail.com",
        // "currentPassword": "Kabi@1234",
        // "newPassword": "Kabi@12345"
      }),
    );
    // Check the response status
    if (response.statusCode == 200) {
      // Parse the response if successful

      if (kDebugMode) {
        print(response.body);
      }

      SnackbarService().showSnackBar("Password changed successfully!", context);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setBool("isLoggedIn", false);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SigninPage()),
        (Route<dynamic> route) => false,
      );
      return true;
    } else {
      // Handle error response
      if (kDebugMode) {
        print(context.read<UserCubit>().state.email.trim());

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
