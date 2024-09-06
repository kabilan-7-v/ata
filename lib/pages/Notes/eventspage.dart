import 'package:flutter/material.dart';

class Eventspage extends StatelessWidget {
  const Eventspage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const TabBar(
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                indicatorColor: Color.fromRGBO(225, 104, 17, 1),
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: '                       On Going Events          ',
                  ),
                  Tab(text: '                      UpComing Events          '),
                ]),
            Expanded(
                child:
                    TabBarView(children: [onGoingEvents(context), Container()]))
          ],
        ),
      ),
    );
  }

  Widget onGoingEvents(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context, ind) {
          return smallcardnotexpand(context);
        });
  }

  Widget smallcardnotexpand(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Image.asset(
            width: double.infinity,
            "assets/imgs/Rectangle 3904.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
