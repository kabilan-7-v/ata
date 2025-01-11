// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'dart:convert';
import 'package:ata/cubit/usercubit.dart';
import 'package:ata/models/usermodel.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

Future<bool> login(String email, String password, BuildContext context) async {
  // Define the URL
  const String url = 'https://atabackend.onrender.com/auth/login';

  try {
    // Make the POST request
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    // Check the response status
    if (response.statusCode == 200) {
      // Parse the response if successful
      final data = jsonDecode(response.body);
      if (kDebugMode) {
        print(emoji);
        print(data);
        print(data["user"]);
        print(emoji);
      }

      context.read<UserCubit>().setUser(UserModel.fromJson(data["user"]));
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

Future<bool> createAccount(
    String name, String email, String password, BuildContext context) async {
  // Define the URL
  const String url = 'https://atabackend.onrender.com/auth/register';

  try {
    // Make the POST request
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'firstName': name,
        'lastName': "last name",
        'userName': name,
        'phoneNumber': "phone number",
        'email': email,
        'password': password,
      }),
    );

    // Check the response status
    if (response.statusCode == 201) {
      // Parse the response if successful
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
    }
  }
  return false;
}




 bool isValidEmail(String email) {
  // Regular expression for validating an email
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  return emailRegex.hasMatch(email);
}

bool isValidPassword(String password) {
  // Regular expression for validating a strong password
  final RegExp passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$',
  );
  return passwordRegex.hasMatch(password);
}








// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<void> login(BuildContext context) async {
//   const String url = "https://atabackend.onrender.com/auth/login";

//   try {
//     final response = await http.post(
//       Uri.parse(url),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(
//         {"email": "true", "password": "pass"}
//         ),
//     );
//     print(response.statusCode);
//     // 
//     if (response.statusCode == 200) {
//       // print("Successfull for login 🥳🥳🥳🥳🥳🥳🥳🥳🥳");
//     }
//   } catch (e) {
//     debugPrint("error:" + e.toString());
//   }
// }
