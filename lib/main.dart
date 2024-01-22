import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bar_app/provider/auth_provider.dart' as MyAppAuthProvider;
import 'package:bar_app/provider/imagepick_provider.dart';
import 'package:bar_app/screen/home_screen.dart';
import 'package:bar_app/screen/login_screen.dart';
import 'package:bar_app/screen/product_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyAppAuthProvider.AuthProvider()),
        ChangeNotifierProvider(create: (_) => ImagePickProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'bar app',
          darkTheme: ThemeData(
              brightness: Brightness.dark, primarySwatch: Colors.red),
          themeMode: ThemeMode.dark,
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  return const HomePage();
                }
                return const LoginScreen();
              })),
    );
  }
}
