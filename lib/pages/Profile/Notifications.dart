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
                "Kabilan v",
                "If you need to reschedule, please contact us at [Phone Number] or visit [App/Website Link].We apologize for any inconvenience this may cause.",
                1,
                context),
            notificationcard(
                true,
                "2 Hours",
                "Perashu",
                "If you need to reschedule, please contact us at [Phone Number] or visit [App/Website Link].We apologize for any inconvenience this may cause.",
                1,
                context),
            notificationcard(
                false,
                "2 Hours",
                "Bharat raj",
                "If you need to reschedule, please contact us at [Phone Number] or visit [App/Website Link].We apologize for any inconvenience this may cause.",
                1,
                context),
            notificationcard(
                false,
                "2 Hours",
                "Akash Kumar",
                "If you need to reschedule, please contact us at [Phone Number] or visit [App/Website Link].We apologize for any inconvenience this may cause.",
                1,
                context)
          ],
        ),
      ),
    );
  }

  Widget notificationcard(blur, String date_time, String tittle, String message,
      int status, BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 22,
                      width: 22,
                      child:
                          Image.asset("assets/icons/notification_unread.png")),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      tittle,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(message),
              ),
            ],
          ),
        ),
        line(context),
      ],
    );
  }

  Widget line(BuildContext context) {
    return Container(
      height: 0.5,
      width: MediaQuery.of(context).size.width - 30,
      color: Colors.black,
    );
  }
}
