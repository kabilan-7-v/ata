import 'package:ata/pages/congrats.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 68),
            const Row(
              children: [
                SizedBox(
                  width: 43,
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
                  width: 43,
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
                  width: 55,
                ),
                Image.asset("assets/imgs/google.png"),
                SizedBox(
                  width: 25,
                ),
                Image.asset("assets/imgs/logos_facebook.png"),
              ],
            ),
            const SizedBox(height: 50),
            const Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text("Name",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 8),
            Center(
                child: customTextfield(
                    context, const Icon(Icons.person_2_outlined), "Ex.John")),
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
                child: customTextfield(context,
                    const Icon(Icons.email_outlined), "example@example.com")),
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
                child: customTextfield(context, const Icon(Icons.lock_outline),
                    "8+ Character, 1 Capital letter")),
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
            const Row(
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
            )
          ],
        ),
      ),
    );
  }

  Widget customTextfield(BuildContext context, Icon icon, String hinttext) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      // height: 80,
      child: TextFormField(
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey[400]),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2),
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
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Congratspage()));
        },
        child: Text(
          buttonname,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
