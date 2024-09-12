import 'package:ata/pages/Notes/eventspage.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 150,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Image.asset("assets/imgs/boy.png"),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 34, vertical: 15),
          child: Text(
            "Find?\nEvents in one Place! 💣",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Center(
          child: Text(
            "Event management is the creation and\ndevelopment of small and large-scale\npersonal or corporate event such a festival\nconferences extra",
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 150,
            ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(225, 104, 17, 1)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Eventspage()));
                },
                child: const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                      size: 40,
                    )
                  ],
                )),
          ),
        )
      ],
    ));
  }
}
