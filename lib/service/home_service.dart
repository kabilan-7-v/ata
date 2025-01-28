// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:ata/cubit/usercubit.dart';
import 'package:ata/models/homemodels.dart';
import 'package:ata/service/common_service.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeService {
  static Future<List<Popularevents>> fetchPopularevents() async {
    List<Popularevents> populareventslst = [];
    String url = '$renderurl/events/get';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the JSON response into a list of events
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        // log(jsonResponse.toString());

        for (var i in jsonResponse) {
          log(i.toString());
          populareventslst.add(Popularevents.fromJson(i));
        }
        return populareventslst;
      } else {
        throw Exception('Failed to load events: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<List<Latestpost>> fetchLatestPost() async {
    List<Latestpost> latestpostlst = [];
    String url = '$renderurl/blog/get';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the JSON response into a list of events

        final List<dynamic> jsonResponse = jsonDecode(response.body);
        // log("fetch_latestpost${jsonResponse} :${jsonResponse.length}");

        for (var i in jsonResponse) {
          if (!CommonService.isTodayOrFuture(i["createdAt"])) {
            latestpostlst.add(Latestpost.fromJson(i));
          }
        }
        return latestpostlst;
      } else {
        throw Exception('Failed to load events: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<List<Sponsers>> fetchSponsers() async {
    List<Sponsers> sponser = [
      Sponsers(
        img: "assets/sponser/sponser1.webp",
      ),
      Sponsers(
        img: "assets/sponser/sponser2.webp",
      ),
      Sponsers(
        img: "assets/sponser/sponser3.webp",
      ),
      Sponsers(img: "assets/sponser/sponser4.webp")
    ];
    return sponser;
  }

  static storerecentsearch(String prompt, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = context.read<UserCubit>().state.userid;
    List<String>? lst = prefs.getStringList(userid!);
    if (lst == null) {
      prefs.setStringList(userid, []);
    }
    if (prompt.isNotEmpty) {
      lst!.add(prompt.trim());
      prefs.setStringList(userid, lst);
    }
  }

  static Future<List<String>> getreacentsearch(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = context.read<UserCubit>().state.userid;

    return prefs.getStringList(userid!) ?? [];
  }
}
