// ignore_for_file: non_constant_identifier_names

import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notificationspage extends StatefulWidget {
  const Notificationspage({super.key});

  @override
  State<Notificationspage> createState() => _NotificationspageState();
}

class _NotificationspageState extends State<Notificationspage> {
  List<String> Notifylst = [];
  @override
  void initState() {
    // TODO: implement initState
    setnotifylst();
    super.initState();
  }

  setnotifylst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Notifylst = prefs.getStringList("notification")!;
    print(Notifylst.reversed);
    print(emoji);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int len = Notifylst.length;

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
            Notifylst.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.notifications_off_outlined,
                            size: 45,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'No Notifications',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: len,
                    reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, ind) {
                      return notificationcard(
                          true, "Ata", Notifylst[ind], 1, context);
                    }),
          ],
        ),
      ),
    );
  }

  Widget notificationcard(
      blur, String tittle, String message, int status, BuildContext context) {
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
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  message.split("#*#")[0],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(message.split("#*#")[1].split(".")[0]),
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
