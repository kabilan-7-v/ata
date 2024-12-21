// ignore_for_file: use_build_context_synchronously

import 'package:ata/Authentication/signin_page.dart';
import 'package:ata/service/login.dart';
import 'package:ata/widget/const.dart';
import 'package:ata/widget/snackbar.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  bool isloading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
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
          key: _key,
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
                    "Sign Up",
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
              const Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text("Name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                  child: customTextfield(
                      context,
                      const Icon(Icons.person_2_outlined),
                      "Ex.John",
                      nameController,
                      "Please Enter Name")),
              const SizedBox(height: 30),
              const Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text("Email",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                  child: customTextfield(
                      context,
                      const Icon(Icons.email_outlined),
                      "example@example.com",
                      emailController,
                      "Please Enter Email adress")),
              const SizedBox(height: 30),
              const Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text("Password",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                  child: customTextfield(
                      context,
                      const Icon(Icons.lock_outline),
                      "8+ Character, 1 Capital letter",
                      passController,
                      "Please Enter a Password")),
              const SizedBox(height: 50),
              Center(
                child: Text(
                  "Creating an account means you’re okay with \nour Terms of Service and our Privacy Policy",
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ),
              const SizedBox(height: 50),
              Center(child: custombutton(context, "Create an Account")),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninPage()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    Text(
                      "Sign in",
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
          if (!_key.currentState!.validate()) return;

          setState(() {
            isloading = true;
          });
          bool isaccountcreated = await createAccount(nameController.text,
              emailController.text, passController.text, context);
          // login("balaji.21ad@kct.ac.in", "Balaji@12");
          setState(() {
            isloading = false;
          });
          if (isaccountcreated == true) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SigninPage()));
          } else {
            SnackbarService()
                .showSnackBar("Enter Email Already taken", context);
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
