
import 'package:ata/service/edit_user_profile.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  bool isloading = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController bio = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController dateofbirth = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    username.dispose();
    bio.dispose();
    gender.dispose();
    dateofbirth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
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
            customtextfield("User Name", "Enter User Name", username),
            customtextfield("Email", "Enter Email", email),
            customtextfield("Bio", "Enter ..", bio),
            customtextfield("Gender", "Male", gender),
            customtextfield("Date of Birth", "DD/MM/YYYY", dateofbirth),
            const SizedBox(
              height: 15,
            ),
            custombutton(context, "Edit Profile")
          ],
        ),
      ),
    );
  }

  Widget custombutton(BuildContext context, String buttonname) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          height: 50, width: MediaQuery.of(context).size.width - 32),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(225, 104, 17, 1)),
        onPressed: () async {
          await editUserProfile(name.text, username.text, email.text, bio.text,
              gender.text, dateofbirth.text, context, "userid", "phno");
        },
        child: isloading
            ? const CircularProgressIndicator()
            : Text(
                buttonname,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  customtextfield(label, hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller,
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
