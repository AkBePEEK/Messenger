import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/pages/login_page.dart';
import 'package:social_media_app/pages/register_page.dart';
import 'firebase_options.dart';
import 'home_page.dart';
import 'models/Wrapper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media X',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Wrapper(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => RegistrationScreen(),
        '/home': (context) => Home(changeTheme: (bool useLightMode) {  },),
      },
      onUnknownRoute: (_) => MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}