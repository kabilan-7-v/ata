import 'package:ata/pages/Profile/raiseticket.dart';
import 'package:ata/pages/Profile/trackticket.dart';
import 'package:flutter/material.dart';

class Helpsupport extends StatelessWidget {
  const Helpsupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
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
                  icon: const Icon(Icons.keyboard_arrow_left_sharp)),
              const Text(
                "Help & Support",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
          const SizedBox(height: 40),
          customsupportticket(context)
        ],
      ),
    );
  }

  Widget customsupportticket(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(39, 41, 56, 1),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              "Recent support tickets",
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              "There are no recent support ticket raisee in last 30 days!",
              style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Center(
            child: Text(
              "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",
              style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Raiseticket()));
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/imgs/book_online.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Raise a ticket",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1))),
                      ],
                    )),
                OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Trackticket()));
                    },
                    style: OutlinedButton.styleFrom(),
                    child: Row(
                      children: [
                        Image.asset("assets/imgs/book_online.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Track tickets",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1))),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
