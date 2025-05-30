import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';
import '../pages/login_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user != null) {
            // User is logged in
            return Home(changeTheme: (bool useLightMode) {  },);
          } else {
            // User is not logged in
            return LoginPage();
          }
        }
        // Loading state
        return CircularProgressIndicator();
      },
    );
  }
}