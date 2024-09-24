import 'package:flutter/material.dart';

class Tickethistory extends StatelessWidget {
  const Tickethistory({super.key});
  final int value = 55;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.keyboard_arrow_left_sharp)),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Ticket History",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
            customcontanier(
                context, "Yoga Day", "55", "C5,C6", "6th July, 2024 - 4:00 PM"),
            customcontanier(context, "Flowers Day", "65", "A5,A6,A8",
                "6th July, 2024 - 4:00 PM"),
            customcontanier(context, "Sports Day", "205", "H5,C6,G7",
                "6th July, 2024 - 4:00 PM"),
            customcontanier(context, "Pongal Celebration", "82", "J2,C6",
                "6th July, 2024 - 4:00 PM"),
            customcontanier(context, "Bogi Celebration", "15", "B1,B2,B3",
                "6th July, 2024 - 4:00 PM"),
          ],
        ),
      ),
    );
  }

  Widget customcontanier(BuildContext context, eventname, amount, seats, date) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        customtext(15, 30, "Event Name", const Color.fromRGBO(96, 95, 95, 1),
            14, FontWeight.normal),
        customtext(35, 30, eventname, const Color.fromRGBO(225, 104, 17, 1), 16,
            FontWeight.w500),
        customtext(85, 30, "Date", const Color.fromRGBO(96, 95, 95, 1), 14,
            FontWeight.normal),
        customtext(110, 30, date, const Color.fromRGBO(96, 95, 95, 1), 17,
            FontWeight.bold),
        customtext(15, 280, "Total Amount", const Color.fromRGBO(96, 95, 95, 1),
            14, FontWeight.normal),
        customtext(38, 280, "\$$amount", const Color.fromRGBO(96, 95, 95, 1),
            14, FontWeight.bold),
        customtext(85, 280, "Seats", const Color.fromRGBO(96, 95, 95, 1), 14,
            FontWeight.normal),
        customtext(110, 280, seats, const Color.fromRGBO(96, 95, 95, 1), 16,
            FontWeight.bold),
        Positioned(
          right: 120,
          child: Container(
            height: 15,
            width: 15,
            decoration:
                BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
          ),
        ),
        customline(10),
        customline(15),
        customline(20),
        customline(25),
        customline(30),
        customline(35),
        customline(40),
        customline(45),
        customline(50),
        customline(55),
        customline(60),
        customline(65),
        customline(70),
        customline(75),
        customline(80),
        customline(85),
        customline(90),
        customline(95),
        customline(100),
        customline(105),
        customline(110),
        customline(115),
        customline(120),
        customline(125),
        customline(130),
        customline(135),
        customline(140),
        customline(145),
        customline(150),
        customline(155),
        Positioned(
          right: 120,
          bottom: 1,
          child: Container(
            height: 15,
            width: 15,
            decoration:
                BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
          ),
        )
      ],
    );
  }

  customline(double height) {
    return Positioned(
      right: 127,
      bottom: height,
      child: Container(
        height: 3,
        width: 2,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
      ),
    );
  }

  customtext(double x, double y, text, color, double size, bold) {
    return Positioned(
        top: x,
        left: y,
        child: Text(
          text,
          style: TextStyle(
            fontSize: size,
            color: color,
            fontWeight: bold,
          ),
        ));
  }
}
