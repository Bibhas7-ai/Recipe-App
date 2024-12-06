import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/provider/bottomnav_provider.dart';
import 'package:food/provider/login_provider.dart';
import 'package:food/provider/profile_provider.dart';

import 'package:food/provider/recipe_provider.dart';


import 'package:food/screens/login_screen.dart';
import 'package:food/screens/nav_screen.dart';
import 'package:food/screens/profile_screen.dart';

import 'package:food/screens/register_screen.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => NavbarProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/navscreen': (context) => const NavScreen(),
        '/register': (context) => const RegisterScreen(),

        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
