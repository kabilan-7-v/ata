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
    super.initState();
  }

  setnotifylst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Notifylst = prefs.getStringList("notification")!;
    setState(() {});
  }

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
                    itemCount: Notifylst.length,
                    itemBuilder: (context, ind) {
                      return notificationcard(
                          true, "2 Hours", "Ata", Notifylst[ind], 1, context);
                    }),
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
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
