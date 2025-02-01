import 'package:ata/pages/commonpage.dart';
import 'package:ata/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({super.key});

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  bool connect_internet = false;
  bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  get_internet() async {
    bool isConnected = await InternetConnection().hasInternetAccess;
    if (isConnected) {
      setState(() {
        connect_internet = isConnected;
      });
      print('Device is connected to the internet$connect_internet');
    } else {
      setState(() {
        connect_internet = isConnected;
      });
      print('Device is not connected to the internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Icon(
                Icons.signal_wifi_connected_no_internet_4_rounded,
                size: 55,
              ),
            ),
            const Center(child: Text("No internet connectivity")),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  loading = true;
                  setState(() {});
                  await get_internet();
                  loading = false;
                  setState(() {});
                  if (connect_internet) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Commonpage()),
                        (e) => false);
                  }
                },
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      color: orange, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: loading
                          ? const CircularProgressIndicator()
                          : const Text(
                              "Retry",
                              style: TextStyle(color: Colors.white),
                            )),
                ),
              ),
            )
          ]),
    );
  }
}
