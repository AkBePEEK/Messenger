import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(SocialMediaApp());
}

class SocialMediaApp extends StatefulWidget {
  const SocialMediaApp({super.key});

  @override
  State<SocialMediaApp> createState() => _SocialMediaAppState();
}

class _SocialMediaAppState extends State<SocialMediaApp> {

  ThemeMode themeMode = ThemeMode.light;

  void changeThemeMode(bool useLightMode) {
    setState(() {
      // 1
      themeMode = useLightMode
          ? ThemeMode.light //
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Media X';

    ThemeMode themeMode = ThemeMode.light; // Manual theme toggle

    //3
    return MaterialApp(
      title: appTitle,
      //debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner

      themeMode: themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),

      home: Home(
        changeTheme: changeThemeMode,
      ),
    );
  }

}