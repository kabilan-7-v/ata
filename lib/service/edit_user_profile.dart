import 'dart:convert';

import 'package:ata/Authentication/signin_page.dart';
import 'package:ata/cubit/usercubit.dart';
import 'package:ata/widget/const.dart';
import 'package:ata/widget/snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

Future<bool> editUserProfile(
    String name,
    String username,
    String email,
    String bio,
    String gender,
    String dateofbirth,
    BuildContext context,
    String userid,
    String phno) async {
  // Define the URL

  String currentuser = context.read<UserCubit>().state.userid ?? "Null";
  String url = 'https://atabackend.onrender.com/auth/edit/$currentuser';

  try {
    // Make the POST request
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "userName": username,
        "email": email,
        "bio": bio,
        "gender": gender,
        "phoneNumber": phno,
        "DOB": dateofbirth
      }),
    );
    // Check the response status
    if (response.statusCode == 200) {
      // Parse the response if successful
      final data = jsonDecode(response.body);

      if (kDebugMode) {
        print(data);
        print(emoji);
      }
      SnackbarService().showSnackBar("Profile changed suceesfully", context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SigninPage()),
        (Route<dynamic> route) => false,
      );
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
