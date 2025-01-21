import 'package:ata/service/raise_ticket_service.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class Trackticket extends StatefulWidget {
  const Trackticket({super.key});

  @override
  State<Trackticket> createState() => _TrackticketState();
}

class _TrackticketState extends State<Trackticket> {
  List tracklst = [];
  @override
  void initState() {
    // TODO: implement initState
    settracklst();

    super.initState();
  }

  settracklst() async {
    tracklst = await raisetikect(context);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(39, 41, 56, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ListView.builder(
                    itemCount: tracklst.length,
                    shrinkWrap: true,
                    itemBuilder: (context, ind) {
                      print(tracklst[ind]);
                      return customtrack(
                          tracklst[ind]["status"] == "cancelled");
                    }))
          ],
        ),
      ),
    );
  }

  customtrack(bool iscompleted) {
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
                const Text(
                  "Membership Purchase",
                  style: TextStyle(
                      fontSize: 17, color: Color.fromRGBO(246, 243, 243, 1)),
                ),
                const Spacer(),
                Icon(
                  Icons.check_circle_outline,
                  color: iscompleted
                      ? Colors.red
                      : const Color.fromRGBO(67, 162, 65, 1),
                  size: 18,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  iscompleted ? "Cancelled" : "Completed",
                  style: TextStyle(
                      fontSize: 15,
                      color: iscompleted
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
            customtracksuccess("Request Registered", Colors.grey[500]),
            customline(),
            customtracksuccess(iscompleted ? "Cancelled" : "Issues Resolved",
                const Color.fromRGBO(246, 243, 243, 1)),
          ],
        ),
      ),
    );
  }

  customtracksuccess(text, color) {
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
      )
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
