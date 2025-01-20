import 'package:ata/Authentication/create_account.dart';
import 'package:ata/cubit/usercubit.dart';
import 'package:ata/pages/commonpage.dart';
import 'package:ata/service/notification_service.dart';
import 'package:ata/widget/const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _backgroundHandler(RemoteMessage message) async {
  // Handle background message

  print('Handling a background message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool("switch") == null) {
    prefs.setBool("switch", true);
  }

  if (prefs.getBool("switch") == true) {
    await LocalNotificationService().init();
    gettoken();
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the received message here
      String body = message.notification?.body ?? "Ata";
      LocalNotificationService().showNotification(
        body: body,
        title: "ATA",
        id: 0,
      );
      print("Received message: ${message.notification?.body}");
    });
  }
  //FCM Token: fEHosdlbSJuwnCwgnQgEhX:APA91bHLHjSNiM8uApWxIFBrEF395TSWrYMUNQc-OpExDPqjwpNqn5bsQA9ge4kL4HZxnY0K-JTCoFgWX6aaocn0hQn4t07ZGXeqz1VY4DrcA2Zqk4PG84s
  runApp(const MyApp());
}

void gettoken() {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  FirebaseMessaging.instance.subscribeToTopic('all');
  firebaseMessaging.getToken().then((token) {
    if (kDebugMode) {
      print("FCM Token: $token");
      print(emoji);
    }
  });
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
