import 'package:rock_vin/screens/home/home_page.dart';
import 'package:rock_vin/screens/login_screen/components/user_login/user_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/auth.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context,
        listen: false); //Get Data from 'app/servises/auth.dart' using provider

    return StreamBuilder<User?>(
      //  Create stream builder
      stream: auth
          .authStateChanges(), // check authStateChanges in auth.dart for check the user is logged
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return const LoginPage();
          }
          return const HomePage();
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator.adaptive()),
        );
      },
    );
  }
}
