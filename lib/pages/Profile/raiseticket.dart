import 'package:flutter/material.dart';

class Raiseticket extends StatelessWidget {
  const Raiseticket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    Icons.keyboard_arrow_left,
                  )),
              const Text(
                'Raise tickets',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              'Issue Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SizedBox(
              height: 150,
              child: TextField(
                  scrollPadding: EdgeInsets.zero,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: "Write a description",
                      contentPadding: EdgeInsets.zero,
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 199, 196, 196)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 199, 196, 196))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 199, 196, 196))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 199, 196, 196))),
                      prefixIcon: Icon(Icons.message_outlined))),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(160, 160, 162, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Text(
                "Raise ticket",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
