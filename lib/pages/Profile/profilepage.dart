import 'package:ata/pages/Profile/drawer.dart';
import 'package:ata/pages/Profile/editprofile.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});
  static var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_box_outlined,
                size: 30,
              )),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ]),
        endDrawer: const Customdrawer(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(child: customprofilecard(context)),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customeditorshareprofile(context, Icons.person, "Edit Profile",
                  () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Editprofile()));
              }),
              customeditorshareprofile(
                  context, Icons.share, "Share Profile", () {}),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          custommembership(context),
        ]));
  }

  Widget customprofilecard(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                  width: 90,
                  height: 90,
                  child: Image.asset(
                    "assets/imgs/Profile.png",
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                width: 20,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deepika❤",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "“Old is Gold”",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Some thing else Bio",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          )),
    );
  }

  Widget customeditorshareprofile(BuildContext context, icon, name, ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 39,
        width: MediaQuery.of(context).size.width / 2.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color.fromRGBO(225, 104, 17, 1))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(
                width: 8,
              ),
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget custommembership(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 5)
          ],
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color.fromRGBO(225, 104, 17, 1))),
      child: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wallet_membership_outlined),
            SizedBox(
              width: 8,
            ),
            Text(
              "View Membership details",
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
