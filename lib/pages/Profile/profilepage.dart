// ignore_for_file: prefer_const_constructors

import 'package:ata/cubit/usercubit.dart';
import 'package:ata/pages/Profile/drawer.dart';
import 'package:ata/pages/Profile/editprofile.dart';
import 'package:ata/pages/Profile/membership.dart';
import 'package:ata/widget/const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton_shimmer_loading/skeleton_shimmer_loading.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});
  static var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  bool isloading = true;

  @override
  void initState() {
    getuserdata();
    super.initState();
  }

  getuserdata() async {
    await Future.delayed(const Duration(seconds: 5));

    isloading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppShimmerLoading(
      isLoading: isloading,
      child: Scaffold(
          backgroundColor: ataBackgroundcolor,
          appBar: AppBar(
              leading: const SizedBox(),
              backgroundColor: ataBackgroundcolor,
              actions: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                ),
              ]),
          endDrawer: const Customdrawer(),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(child: ShimmerItem(child: customprofilecard(context))),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customeditorshareprofile(
                    context,
                    "assets/icons/person_edit_24dp_000000_FILL0_wght400_GRAD0_opsz24.png",
                    "Edit Profile", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Editprofile()));
                }),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            custommembership(context),
          ])),
    );
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://fastly.picsum.photos/id/65/4912/3264.jpg?hmac=uq0IxYtPIqRKinGruj45KcPPzxDjQvErcxyS1tn7bG0",
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.read<UserCubit>().state.userName,
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

  Widget customeditorshareprofile(
      BuildContext context, String icon, String name, ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color.fromRGBO(225, 104, 17, 1))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 25, width: 25, child: Image.asset(icon)),
              const SizedBox(
                width: 8,
              ),
              Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget custommembership(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Membership()));
      },
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
            color: orange,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color.fromRGBO(225, 104, 17, 1))),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wallet_membership_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "View Membership",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
