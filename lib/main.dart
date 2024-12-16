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
        ChangeNotifierProvider(create: (_) => Latestpostlst()),
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
        home: const CreateAccount(),
      ),
    );
  }
}
