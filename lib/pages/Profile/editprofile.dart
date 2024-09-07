import 'package:flutter/material.dart';

class Editprofile extends StatelessWidget {
  const Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      Icons.arrow_back_ios_outlined,
                      size: 22,
                    )),
                const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/imgs/Profile.png")),
            SizedBox(
              height: 15,
            ),
            Text(
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
            focusColor: Color.fromRGBO(249, 225, 207, 1),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromRGBO(249, 225, 207, 1)),
            ),
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromRGBO(239, 180, 135, 1)),
            )),
      ),
    );
  }
}
