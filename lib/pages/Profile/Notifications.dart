import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class Notificationspage extends StatelessWidget {
  const Notificationspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: ataBackgroundcolor,
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search"),
              ),
            ),
            notificationcard(
                true,
                "2 Hours",
                "If you need to reschedule, please contact us at [Phone Number] or visit [App/Website Link].We apologize for any inconvenience this may cause.",
                1),
            notificationcard(
                true,
                "2 Hours",
                "If you need to reschedule, please contact us at [Phone Number] or visit [App/Website Link].We apologize for any inconvenience this may cause.",
                1),
            notificationcard(
                false,
                "2 Hours",
                "If you need to reschedule, please contact us at [Phone Number] or visit [App/Website Link].We apologize for any inconvenience this may cause.",
                1),
            notificationcard(
                false,
                "2 Hours",
                "If you need to reschedule, please contact us at [Phone Number] or visit [App/Website Link].We apologize for any inconvenience this may cause.",
                1)
          ],
        ),
      ),
    );
  }

  Widget notificationcard(blur, String dateTime, String message, int status) {
    return Column(
      children: [
        Opacity(
          opacity: blur == true ? 1 : 0.3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.notification_add_outlined),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(message),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(dateTime),
                )
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(),
        )
      ],
    );
  }
}
