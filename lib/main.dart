import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter_flash_cat/screens/chat_screen.dart';
import 'package:udemy_flutter_flash_cat/screens/login_screen.dart';
import 'package:udemy_flutter_flash_cat/screens/registration_screen.dart';
import 'package:udemy_flutter_flash_cat/screens/welcome_screen.dart';

void main() async {
  //Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize Firebase
  await Firebase.initializeApp();
  //run the app
  runApp(const FlashChat());
}
class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
    );
  }
}
