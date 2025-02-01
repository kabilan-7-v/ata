// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'dart:convert';
import 'package:ata/cubit/usercubit.dart';
import 'package:ata/models/usermodel.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> login(String email, String password, BuildContext context) async {
  // Define the URL
   String url = '$renderurl/auth/login';

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
      // if (kDebugMode) {
      //   print(data['user']["_id"]);
      // }

      context.read<UserCubit>().setUser(UserModel.fromJson(data['user']));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLoggedIn", true);
      await prefs.setStringList("user_details", [
        data['user']['userName'] ?? "NULL",
        data['user']['email'] ?? "Null",
        data['user']['phoneNumber'] ?? "Null",
        data['user']['bio'] ?? "Null",
        data['user']['image'] ?? "Null",
        data['user']['dateOfBirth'] ?? "Null",
        data['user']['gender'] ?? "Null",
        data['user']['_id'] ?? "Null"
      ]);
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
   String url = '$renderurl/auth/register';

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
      if (kDebugMode) {
        print(data);
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

setUserDetails(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  List<String>? userLst = prefs.getStringList("user_details");
  if (userLst != null) {
    Map<String, dynamic> user = {
      "userName": userLst[0],
      "email": userLst[1],
      "phoneNumber": userLst[2],
      "bio": userLst[3],
      "image": userLst[4],
      "dateOfBirth": userLst[5],
      "gender": userLst[6],
      "_id": userLst[7]
    };

    context.read<UserCubit>().setUser(UserModel.fromJson(user));
  }
}



// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<void> login(BuildContext context) async {
//   const String url = "$renderurl/auth/login";

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
