import 'package:ata/service/raise_ticket_service.dart';
import 'package:ata/widget/const.dart';
import 'package:ata/widget/snackbar.dart';
import 'package:flutter/material.dart';

class Raiseticket extends StatefulWidget {
  const Raiseticket({super.key});

  @override
  State<Raiseticket> createState() => _RaiseticketState();
}

class _RaiseticketState extends State<Raiseticket> {
  TextEditingController issuecontroller = TextEditingController();
  TextEditingController issuetitle = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  bool istap = false;
  bool isloading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    issuecontroller.dispose();
    issuetitle.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ataBackgroundcolor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: ataBackgroundcolor,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          'Raise tickets',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Issue Tittle',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextFormField(
                  onTap: () {
                    istap = true;
                    setState(() {});
                  },
                  validator: (value) {
                    if (value!.isEmpty) return "Please enter issue title";

                    return null;
                  },
                  controller: issuetitle,
                  decoration: const InputDecoration(
                    hintText: "issuse title",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 199, 196, 196)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 199, 196, 196))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 199, 196, 196))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 199, 196, 196))),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Issue Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: SizedBox(
                height: 150,
                child: TextFormField(
                    onTap: () {
                      istap = true;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty)
                        return "Please enter issue description";

                      return null;
                    },
                    scrollPadding: EdgeInsets.zero,
                    maxLines: null,
                    expands: true,
                    controller: issuecontroller,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                        hintText: "Write a description",
                        contentPadding: EdgeInsets.zero,
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 199, 196, 196)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 199, 196, 196))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 199, 196, 196))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 199, 196, 196))),
                        prefixIcon: Icon(Icons.message_outlined))),
              ),
            ),
            const Spacer(),
            istap
                ? Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: InkWell(
                      onTap: () async {
                        if (!_key.currentState!.validate()) return;

                        isloading = true;
                        setState(() {});
                        bool completed = await raisedticket(
                            issuecontroller.text, context, issuetitle.text);
                        isloading = false;
                        if (completed) {
                          SnackbarService().showSnackBar(
                              "Ticket Raised Successfully", context);
                        }
                        setState(() {});
                      },
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: istap
                              ? orange
                              : const Color.fromRGBO(160, 160, 162, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: isloading
                            ? const Center(child: CircularProgressIndicator())
                            : const Center(
                                child: Text(
                                "Raise ticket",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                      ),
                    ),
                  )
                : Padding(
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
                        "Raise ticket",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
