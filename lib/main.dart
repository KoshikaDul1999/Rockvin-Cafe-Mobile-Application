import 'package:rock_vin/auth/auth.dart';
import 'package:rock_vin/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthBase>(
            create: (_) => Auth()), //Adding Auth class to the Provider
      ],
      child: MaterialApp(
        title: 'RockV',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: kPrimaryColor,
                fontFamily: 'Montserrat',
              ),
        ),
        home: const LandingPage(),
      ),
    );
  }
}
