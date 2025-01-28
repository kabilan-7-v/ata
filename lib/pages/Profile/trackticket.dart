import 'dart:developer';

import 'package:ata/service/common_service.dart';
import 'package:ata/service/raise_ticket_service.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class Trackticket extends StatefulWidget {
  const Trackticket({super.key});

  @override
  State<Trackticket> createState() => _TrackticketState();
}

class _TrackticketState extends State<Trackticket> {
  List<dynamic> tracklst = [];
  bool isloading = false;
  @override
  void initState() {
    settracklst();

    super.initState();
  }

  settracklst() async {
    // tracklst = await raisetikect(context);
    isloading = true;
    setState(() {});
    tracklst = await getmembership(context);
    log(tracklst.toString());
    tracklst.reversed.toList();
    isloading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        backgroundColor: ataBackgroundcolor,
        title: const Text(
          'Track tickets',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : tracklst.isEmpty
              ? const Center(
                  child: Text(
                  "No Tickets Found !",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ))
              : Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(39, 41, 56, 1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "LIVE",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListView.builder(
                            itemCount: tracklst.length,
                            shrinkWrap: true,
                            reverse: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, ind) {
                              if (tracklst[ind]["status"] == "New") {
                                return customtrack(
                                    tracklst[ind]["status"] == "cancelled"
                                        ? 1
                                        : tracklst[ind]["status"] == "New"
                                            ? 0
                                            : 2,
                                    tracklst[ind]["createdAt"]
                                        .toString()
                                        .split("T")[0],
                                    tracklst[ind]["createdAt"].toString(),
                                    tracklst[ind]["issueTitle"] ??
                                        "Membership Purchase");
                              } else {
                                return const SizedBox();
                              }
                            }),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("CLOSED",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        ListView.builder(
                            itemCount: tracklst.length,
                            shrinkWrap: true,
                            reverse: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, ind) {
                              if (tracklst[ind]["status"] != "New") {
                                return customtrack(
                                    tracklst[ind]["status"] == "cancelled"
                                        ? 1
                                        : tracklst[ind]["status"] == "New"
                                            ? 0
                                            : 2,
                                    tracklst[ind]["createdAt"]
                                        .toString()
                                        .split("T")[0]
                                        .split(".")[0],
                                    tracklst[ind]["createdAt"].toString(),
                                    tracklst[ind]!["issueTitle"] ??
                                        "Membership Purchase");
                              } else {
                                return const SizedBox();
                              }
                            }),
                      ],
                    ),
                  )),
    );
  }

  customtrack(int iscompleted, date, String time, String issusetitle) {
    print(time);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  issusetitle.length <= 20
                      ? issusetitle
                      : issusetitle.substring(0, 20) + "...",
                  style: TextStyle(
                      fontSize: 17, color: Color.fromRGBO(246, 243, 243, 1)),
                ),
                const Spacer(),
                Icon(
                  Icons.check_circle_outline,
                  color: iscompleted == 1
                      ? Colors.red
                      : const Color.fromRGBO(67, 162, 65, 1),
                  size: 18,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  iscompleted == 1
                      ? "Cancelled"
                      : iscompleted == 0
                          ? "Live"
                          : "Completed",
                  style: TextStyle(
                      fontSize: 15,
                      color: iscompleted == 1
                          ? Colors.red
                          : const Color.fromRGBO(67, 162, 65, 1)),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.check_circle,
                color: Color.fromRGBO(67, 162, 65, 1),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "Request Registered",
                style: TextStyle(color: Colors.green),
              ),
              const Spacer(),
              Text(
                date + ",",
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                CommonService.track_ticket_date_format(time),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 10,
              )
            ]),
            customline(),
            customtracksuccess(
                iscompleted == 1
                    ? "Cancelled"
                    : iscompleted == 2
                        ? "Issues Resolved"
                        : "Live",
                const Color.fromRGBO(246, 243, 243, 1),
                date),
          ],
        ),
      ),
    );
  }

  customtracksuccess(text, color, date) {
    return Row(children: [
      const SizedBox(
        width: 10,
      ),
      const Icon(
        Icons.check_circle,
        color: Color.fromRGBO(67, 162, 65, 1),
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        text,
        style: TextStyle(color: color),
      ),
    ]);
  }

  customline() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 10,
            width: 2,
            color: const Color.fromRGBO(67, 162, 65, 1),
          )
        ],
      ),
    );
  }
}
