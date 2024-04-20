import 'package:audio_player/provider/play_list_provider.dart';
import 'package:audio_player/provider/theme_provider.dart';
import 'package:audio_player/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemesProvider()),
      ChangeNotifierProvider(create: (context) => PlayListProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemesProvider>(context).themeData,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
