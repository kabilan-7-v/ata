import 'package:ata/Authentication/create_account.dart';
import 'package:ata/models/homemodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Populareventslist()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CreateAccount(),
      ),
    );
  }
}
