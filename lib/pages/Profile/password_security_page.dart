import 'package:ata/service/forgetpassword_server.dart';
import 'package:flutter/material.dart';

class PasswordSecurityPage extends StatefulWidget {
  const PasswordSecurityPage({super.key});

  @override
  State<PasswordSecurityPage> createState() => _PasswordSecurityPageState();
}

class _PasswordSecurityPageState extends State<PasswordSecurityPage> {
  TextEditingController currenpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    currenpassword.dispose();
    newpassword.dispose();
    confirmpassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Password Security',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (!key.currentState!.validate()) return;
          passwordandsecurity(currenpassword.text, context, newpassword.text);
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
              "Update Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      ),
      body: Form(
        key: key,
        child: Column(
          children: [
            customtextfield("Current Password", "hint", currenpassword,
                "Please enter Currentpassword"),
            customtextfield("New Password", "hint", newpassword,
                "Please enter newpassword"),
            customtextfield("Confirm Password", "hint", confirmpassword,
                "Please enter Confirmpassword"),
          ],
        ),
      ),
    );
  }

  customtextfield(label, hint, TextEditingController controller, errormessage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) return errormessage;

          return null;
        },
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            focusColor: const Color.fromRGBO(249, 225, 207, 1),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(249, 225, 207, 1)),
            ),
            labelText: label,
            labelStyle: const TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(239, 180, 135, 1)),
            )),
      ),
    );
  }
}
