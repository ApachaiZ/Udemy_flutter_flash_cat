import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter_flash_cat/screens/login_screen.dart';
import 'package:udemy_flutter_flash_cat/screens/registration_screen.dart';

import '../constants.dart';
import '../widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation colorAnimation;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      upperBound: 1,
    );

    colorAnimation = ColorTween(
      begin: Colors.black12,
      end: Colors.white,
    ).animate(animationController);

    animationController.forward();
    animationController.addListener(() => setState(() {}));
    colorAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.dispose();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAnimation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: kLogo,
                  child: SizedBox(
                    height: animationController.value * 100,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
              buttonText: 'Log In',
            ),
            RoundedButton(
              color: Colors.blueAccent,
              onPressed:() => Navigator.pushNamed(context, RegistrationScreen.id),
              buttonText: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
