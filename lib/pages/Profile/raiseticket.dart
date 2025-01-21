import 'package:ata/service/raise_ticket_service.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class Raiseticket extends StatefulWidget {
  const Raiseticket({super.key});

  @override
  State<Raiseticket> createState() => _RaiseticketState();
}

class _RaiseticketState extends State<Raiseticket> {
  TextEditingController issuecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: ataBackgroundcolor,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Raise tickets',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              'Issue Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: SizedBox(
              height: 150,
              child: TextField(
                  scrollPadding: EdgeInsets.zero,
                  maxLines: null,
                  expands: true,
                  controller: issuecontroller,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
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
                      prefixIcon: const Icon(Icons.message_outlined))),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              raisetikect();
            },
            child: Padding(
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
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
