import 'package:ata/pages/Profile/Notifications.dart';
import 'package:ata/pages/Profile/aboutus.dart';
import 'package:ata/pages/Profile/appsetting.dart';
import 'package:ata/pages/Profile/helpsupport.dart';
import 'package:ata/pages/Profile/savepage.dart';
import 'package:ata/pages/Profile/tickethistory.dart';
import 'package:flutter/material.dart';

class Customdrawer extends StatelessWidget {
  const Customdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            children: [
              const Spacer(),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset("assets/icons/menu_open.png")),
              const SizedBox(
                width: 20,
              )
            ],
          ),
          customtile(Icons.settings, "App Settings", () {
            Navigator.push(context,
                (MaterialPageRoute(builder: (context) => const Appsettings())));
          }),
          customtile(Icons.browse_gallery, "Gallery", () {}),
          customtile(Icons.save_alt, "Save", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Savepage()));
          }),
          customtile(Icons.notifications, "Notifications", () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Notificationspage()));
          }),
          customtile(Icons.info_outline, "About us", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Aboutuspage()));
          }),
          customtile(Icons.question_mark, "Support", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Helpsupport()));
          }),
          customtile(Icons.airplane_ticket_outlined, "Ticket History", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Tickethistory()));
          }),
        ],
      ),
    );
  }

  customtile(icon, text, ontap) {
    return Column(
      children: [
        ListTile(
          onTap: ontap,
          leading: Icon(icon),
          title: Text(text),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Divider(),
        )
      ],
    );
  }
}
