import 'package:flutter/material.dart';

class Trackticket extends StatelessWidget {
  const Trackticket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 22,
                    )),
                const Text(
                  'Track tickets',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(39, 41, 56, 1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  customtrack(),
                  customtrack(),
                  customtrack(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  customtrack() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 230,
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
                const Icon(
                  Icons.check_circle_outline,
                  color: Color.fromRGBO(67, 162, 65, 1),
                  size: 18,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Closed",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromRGBO(67, 162, 65, 1)),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(118, 119, 122, 0.6),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Color.fromRGBO(255, 255, 255, 1),
                      size: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            const Row(children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "ID: ATA4587K | ETR: Closed",
                style: TextStyle(
                    fontSize: 14, color: Color.fromRGBO(246, 243, 243, 1)),
              ),
            ]),
            SizedBox(
              height: 15,
            ),
            customtracksuccess("Request Registered", Colors.grey[500]),
            customline(),
            customtracksuccess("ETR updated", Colors.grey[500]),
            customline(),
            customtracksuccess("Work in Progress", Colors.grey[500]),
            customline(),
            customtracksuccess(
                "Issues Resolved", Color.fromRGBO(246, 243, 243, 1)),
          ],
        ),
      ),
    );
  }

  customtracksuccess(text, color) {
    return Row(children: [
      SizedBox(
        width: 10,
      ),
      const Icon(
        Icons.check_circle,
        color: Color.fromRGBO(67, 162, 65, 1),
      ),
      SizedBox(
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
          SizedBox(
            width: 20,
          ),
          Container(
            height: 10,
            width: 2,
            color: Color.fromRGBO(67, 162, 65, 1),
          )
        ],
      ),
    );
  }
}
