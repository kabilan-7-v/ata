import 'package:ata/pages/commonpage.dart';
import 'package:flutter/material.dart';

class Congratspage extends StatelessWidget {
  const Congratspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 85,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Congrats!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Image.asset("assets/imgs/congrats.png"),
          const SizedBox(
            height: 90,
          ),
          custombutton(context, "Proceed!")
        ],
      ),
    );
  }

  Widget custombutton(BuildContext context, String buttonname) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            height: 50, width: MediaQuery.of(context).size.width - 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(225, 104, 17, 1)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Commonpage()));
          },
          child: Text(
            buttonname,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
