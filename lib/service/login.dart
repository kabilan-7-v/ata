// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<void> login(String email, String password) async {
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
        print(data["user"]);
      }
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
}

Future<void> createAccount(String name, String email, String password) async {
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
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    // Check the response status
    if (response.statusCode == 200) {
      // Parse the response if successful
      final data = jsonDecode(response.body);
      if (kDebugMode) {
        print(data["user"]);
      }
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
