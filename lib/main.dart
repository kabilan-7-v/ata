import 'package:ata/Authentication/create_account.dart';
import 'package:ata/cubit/usercubit.dart';
import 'package:ata/pages/commonpage.dart';
import 'package:ata/service/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService.setup();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  //FCM Token: fEHosdlbSJuwnCwgnQgEhX:APA91bHLHjSNiM8uApWxIFBrEF395TSWrYMUNQc-OpExDPqjwpNqn5bsQA9ge4kL4HZxnY0K-JTCoFgWX6aaocn0hQn4t07ZGXeqz1VY4DrcA2Zqk4PG84s
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLoggedIn;
  bool isLoading = true;

  // This widget is the root of your application.
  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1)),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        home: isLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : isLoggedIn == true
                ? const Commonpage()
                : const CreateAccount(),
      ),
    );
  }
}
