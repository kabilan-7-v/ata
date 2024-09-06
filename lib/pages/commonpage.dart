import 'package:ata/pages/Home/homepage.dart';
import 'package:ata/pages/Notes/notespage.dart';
import 'package:ata/pages/Profile/profilepage.dart';
import 'package:flutter/material.dart';

class Commonpage extends StatefulWidget {
  const Commonpage({super.key});

  @override
  State<Commonpage> createState() => _CommonpageState();
}

class _CommonpageState extends State<Commonpage> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: tab, children: [Homepage(), NotesPage(), Profilepage()]),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                spreadRadius: 5,
                blurRadius: 7,
              )
            ],
            border: Border.all(
              color: const Color.fromRGBO(249, 225, 207, 1),
              width: 3,
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    tab = 0;
                  });
                },
                child: tab != 0
                    ? Image.asset("assets/icons/home.png")
                    : Image.asset("assets/icons/homelite.png")),
            InkWell(
                onTap: () {
                  tab = 1;
                  setState(() {});
                },
                child: tab != 1
                    ? Image.asset("assets/icons/event_note.png")
                    : Image.asset("assets/icons/event_notelite.png")),
            InkWell(
                onTap: () {
                  setState(() {
                    tab = 2;
                  });
                },
                child: tab != 2
                    ? Image.asset("assets/icons/person.png")
                    : Image.asset("assets/icons/personlite.png")),
          ],
        ),
      ),
    );
  }
}
