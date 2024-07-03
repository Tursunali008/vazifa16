import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifa16/controller/order_controller.dart';
import 'package:vazifa16/controller/product_controller.dart';
import 'package:vazifa16/firebase_options.dart';
import 'package:vazifa16/views/screens/home_page.dart';
import 'package:vazifa16/views/screens/login_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) {
          return ProductController();
        }),
        ChangeNotifierProvider(create: (ctx) {
          return CartController();
        }),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final data = snapshot.data;
                return data == null ? const LoginScreen() : const HomePage();
              }),
        );
      },
    );
  }
}