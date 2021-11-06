import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:test_pro/feature/user/view/subpages/name_field.dart';

import 'feature/tabs/view/tabs_view.dart';

import 'feature/landing/view/landing_view.dart';

import 'feature/user/view/user_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          'landingScreen': (context) => LandingView(),
          'registerScreen': (context) => TabsView(),
          'nameField': (context) => NameField(),
          'userProfile': (context) => UserView()
        },
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LandingView());
  }
}
