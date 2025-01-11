// ignore_for_file: use_build_context_synchronously

import 'package:ata/Authentication/signin_page.dart';
import 'package:ata/pages/commonpage.dart';
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
  final ScrollController _scrollcontroller = ScrollController();

  final GlobalKey<FormState> _key = GlobalKey();
  bool isloading = false;
  bool isterm = false;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: ataBackgroundcolor,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: ataBackgroundcolor,
          leading: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          leadingWidth: 200,
        ),
        body: SingleChildScrollView(
          controller: _scrollcontroller,
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset("assets/imgs/ATA LOGO.png")),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Text("Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 8),
                Center(
                    child: customTextfield(
                        context,
                        const Icon(Icons.person_2_outlined),
                        "Ex.John",
                        nameController,
                        "Please Enter Name",
                        false)),
                const SizedBox(height: 32),
                const Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text("Email",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 8),
                Center(
                    child: customTextfield(
                        context,
                        const Icon(Icons.email_outlined),
                        "example@example.com",
                        emailController,
                        "Please Enter Email adress",
                        true)),
                const SizedBox(height: 32),
                const Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text("Password",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 8),
                Center(
                    child: customTextfield(
                        context,
                        const Icon(Icons.lock_outline),
                        "8+ Char,1 Special Char,1 Capi letter,1 digit",
                        passController,
                        "Please Enter a Password",
                        false)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Checkbox(
                        checkColor: Colors.black,
                        activeColor: orange,
                        value: isterm,
                        onChanged: (val) {
                          setState(() {
                            isterm = !isterm;
                          });
                        }),
                    const Text(
                      "Terms of Service and our Privacy Policy",
                      style: TextStyle(color: Color.fromRGBO(187, 187, 188, 1)),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                Center(child: custombutton(context, "Create an Account")),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SigninPage()),
                        (e) => false);
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
      ),
    );
  }

  Widget customTextfield(BuildContext context, Icon icon, String hinttext,
      TextEditingController controller, String errormessage, bool isemail) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      // height: 80,
      child: TextFormField(
          onTap: () async {
            if (isemail) {
              _scrollcontroller.animateTo(400,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.linear);
            }
          },
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) return errormessage;

            return null;
          },
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: orange),
              ),
              hintStyle: const TextStyle(
                  color: Color.fromRGBO(187, 187, 188, 1), fontSize: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1.2),
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
          height: 50, width: MediaQuery.of(context).size.width - 32),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(225, 104, 17, 1)),
        onPressed: () async {
          if (!_key.currentState!.validate()) return;

          setState(() {
            isloading = true;
          });
          if (!isValidEmail(emailController.text)) {
            SnackbarService().showSnackBar(
                "Give a valid email\n eg: Quindl@example.com", context);
            setState(() {
              isloading = false;
            });
            return;
          }
          if (!isValidPassword(passController.text)) {
            SnackbarService().showSnackBar(
                "Give a valid Password\n eg: P@ssw0rd123!", context);
            setState(() {
              isloading = false;
            });
            return;
          }
          bool isaccountcreated = await createAccount(nameController.text,
              emailController.text, passController.text, context);
          // login("balaji.21ad@kct.ac.in", "Balaji@12");

          if (isaccountcreated == false) {
            SnackbarService()
                .showSnackBar("Enter Email Already taken", context);
            setState(() {
              isloading = false;
            });
            return;
          }
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const SigninPage()),
              (e) => false);
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
}
