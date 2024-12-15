import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class Editprofile extends StatelessWidget {
  const Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 22,
          ),
        ),
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: ataBackgroundcolor,
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/imgs/Profile.png")),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Edit picture or avatar",
              style: TextStyle(color: Color.fromRGBO(67, 195, 249, 1)),
            ),
            customtextfield("Name", "Enter Name"),
            customtextfield("User Name", "Enter User Name"),
            customtextfield("Email", "Enter Email"),
            customtextfield("Bio", "Enter .."),
            customtextfield("Gender", "Male"),
            customtextfield("Date of Birth", "DD/MM/YYYY"),
          ],
        ),
      ),
    );
  }

  customtextfield(label, hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            focusColor: const Color.fromRGBO(249, 225, 207, 1),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(249, 225, 207, 1)),
            ),
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(239, 180, 135, 1)),
            )),
      ),
    );
  }
}
