import 'package:ata/Authentication/signin_page.dart';
import 'package:ata/service/forgetpassword_server.dart';
import 'package:ata/widget/const.dart';
import 'package:ata/widget/snackbar.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();
  bool isloading = false;
  bool isterm = false;
  @override
  void dispose() {
    emailController.dispose();
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
          title: const Text(
            "Forget Password",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          leadingWidth: 0,
          leading: const SizedBox(),
        ),
        body: SingleChildScrollView(
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
                const SizedBox(height: 8),
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
                        "Please Enter Email Address",
                        false)),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Forget password link send to your mail",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Center(child: custombutton(context, "ForgetPassword")),
                const SizedBox(height: 20),
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
          controller: controller,
          onTap: () async {},
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
          bool issend = await forgetpassword(emailController.text);
          if (issend) {
            return SnackbarService().showSnackBar("Link Send to Mail", context);
          } else {
            return SnackbarService()
                .showSnackBar("Give correct mail address", context);
          }
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
