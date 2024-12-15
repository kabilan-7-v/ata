import 'package:ata/pages/Profile/Notifications.dart';
import 'package:ata/pages/Profile/aboutus.dart';
import 'package:ata/pages/Profile/appsetting.dart';
import 'package:ata/pages/Profile/helpsupport.dart';
import 'package:ata/pages/Profile/savepage.dart';
import 'package:ata/pages/Profile/tickethistory.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class Customdrawer extends StatelessWidget {
  const Customdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ataBackgroundcolor,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/icons/drawer/menu_open.png")),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            customtile("assets/icons/drawer/setting.png", "App Settings", () {
              Navigator.push(
                  context,
                  (MaterialPageRoute(
                      builder: (context) => const Appsettings())));
            }),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            customtile("assets/icons/drawer/gallery.png", "Gallery", () {}),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            customtile("assets/icons/drawer/save.png", "Save", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Savepage()));
            }),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            customtile("assets/icons/drawer/notification.png", "Notifications",
                () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Notificationspage()));
            }),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            customtile("assets/icons/drawer/aboutus.png", "About us", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Aboutuspage()));
            }),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            customtile("assets/icons/drawer/support.png", "Support", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Helpsupport()));
            }),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            customtile("assets/icons/drawer/ticket.png", "Ticket History", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Tickethistory()));
            }),
          ],
        ),
      ),
    );
  }

  customtile(String icon, String text, ontap) {
    return Column(
      children: [
        ListTile(
          minTileHeight: 5,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 22,
          ),
          onTap: ontap,
          leading: SizedBox(height: 25, width: 25, child: Image.asset(icon)),
          title: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.keyboard_arrow_right_outlined),
        ),
      ],
    );
  }
}
