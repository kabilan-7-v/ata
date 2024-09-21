import 'package:flutter/material.dart';

class Tickethistory extends StatelessWidget {
  const Tickethistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 247, 248, 1),
      body: const Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(Icons.keyboard_arrow_left_sharp),
              SizedBox(
                width: 10,
              ),
              Text(
                "Ticket History",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          )
        ],
      ),
    );
  }
  // Widget  customcontanier(){
  //   return
  // }
}
