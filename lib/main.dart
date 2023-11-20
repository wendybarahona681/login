import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/views/add_categoria.dart';
import 'package:login/views/home_page.dart';
import 'package:login/views/edit_categorias.dart';
import 'package:login/views/login_page.dart';
import 'package:login/views/sign_up_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

//void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: "/login",
      routes: {
        "/": (context) => const Home(),
        "/add": (context) => const AddCategoria(),
        "/edit": (context) => const EditCategoria(),
        "/login": (context) => const LoginPage(),
        "/signup": (context) => const SignUpPage()
      },
    );
  }
}
