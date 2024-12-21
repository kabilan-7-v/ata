// ignore_for_file: use_build_context_synchronously

import 'package:ata/Authentication/create_account.dart';
import 'package:ata/pages/commonpage.dart';
import 'package:ata/service/login.dart';
import 'package:ata/widget/const.dart';
import 'package:ata/widget/snackbar.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();

  bool isloading = false;
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 68),
              const Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "sign up with",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Image.asset("assets/imgs/google.png"),
                  const SizedBox(
                    width: 25,
                  ),
                  Image.asset("assets/imgs/logos_facebook.png"),
                ],
              ),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset("assets/imgs/ATA LOGO.png")),
              ),
              const SizedBox(height: 50),
              const Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text("Email",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                  child: customTextfield(
                      context,
                      const Icon(Icons.email_outlined),
                      "example@example.com",
                      emailController,
                      "Please Enter Email Address")),
              const SizedBox(height: 30),
              const Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text("Password",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                  child: customTextfield(
                      context,
                      const Icon(Icons.lock_outline),
                      "8+ Character, 1 Capital letter",
                      passController,
                      "Please Enter Password")),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                        color: Color.fromRGBO(76, 117, 244, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const SizedBox(height: 50),
              Center(child: custombutton(context, "Login")),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateAccount()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color.fromRGBO(76, 117, 244, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextfield(BuildContext context, Icon icon, String hinttext,
      TextEditingController controller, String errormessage) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      // height: 80,
      child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) return errormessage;

            return null;
          },
          decoration: InputDecoration(
              hintStyle:
                  const TextStyle(color: Color.fromRGBO(187, 187, 188, 1)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2),
              ),
              hintText: hinttext,
              prefixIcon: icon,
              border: OutlineInputBorder(
                  // gapPadding: 10,
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black)))),
    );
  }

  Widget custombutton(BuildContext context, String buttonname) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          height: 50, width: MediaQuery.of(context).size.width - 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(225, 104, 17, 1)),
        onPressed: () async {
          if (!key.currentState!.validate()) return;

          // createAccount(
          //     nameController.text, emailController.text, passController.text);
          // login("balaji.21ad@kct.ac.in", "Balaji@12");
          setState(() {
            isloading = true;
          });
          bool islogin =
              await login(emailController.text, passController.text, context);
          setState(() {
            isloading = false;
          });
          if (islogin) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Commonpage()));
          } else {
            SnackbarService()
                .showSnackBar("Please enter a correct credentials", context);
          }
        },
        child: isloading
            ? const CircularProgressIndicator()
            : Text(
                buttonname,
                style: const TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
