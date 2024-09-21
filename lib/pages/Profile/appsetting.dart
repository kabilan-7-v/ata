import 'package:flutter/material.dart';

class Appsettings extends StatelessWidget {
  const Appsettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 18,
                  )),
              const Text(
                "App Settings",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          customtile(Icons.shield_outlined, "Password & Security", () {}),
          customtile(Icons.person_2_outlined, "Preferances", () {}),
          customtile(Icons.logout_outlined, "Log Out", () {}),
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Divider(),
        )
      ],
    );
  }
}
