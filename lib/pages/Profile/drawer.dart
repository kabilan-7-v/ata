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
          customtile(Icons.settings, "App Settings"),
          customtile(Icons.browse_gallery, "Gallery"),
          customtile(Icons.save_alt, "Save"),
          customtile(Icons.notifications, "Notifications"),
          customtile(Icons.info_outline, "About us"),
          customtile(Icons.question_mark, "Support"),
          customtile(Icons.airplane_ticket_outlined, "Ticket History"),
        ],
      ),
    );
  }

  customtile(icon, text) {
    return Column(
      children: [
        ListTile(
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
