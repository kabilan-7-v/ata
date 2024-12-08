import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class Appsettings extends StatelessWidget {
  const Appsettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: ataBackgroundcolor,
        title: const Text(
          'App Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Column(
        children: [
          customtile(Icons.shield_outlined, "Password & Security", () {}),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          customtile(Icons.person_2_outlined, "Preferances", () {}),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          customtile(Icons.logout_outlined, "Log Out", () {}),
        ],
      ),
    );
  }

  customtile(icon, text, ontap) {
    return Column(
      children: [
        ListTile(
          minTileHeight: 5,
          contentPadding: const EdgeInsets.symmetric(horizontal: 22),
          onTap: ontap,
          leading: Icon(icon),
          title: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
        ),
      ],
    );
  }
}
