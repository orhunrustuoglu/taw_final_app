import 'package:flutter/material.dart';
import 'package:taw_final_app/data/constants/constant_images.dart';
import 'package:taw_final_app/ui/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //TODO try signing in with idToken from cache ("idToken" key in sharedPref)
    Future.delayed(const Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(context, LoginScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Image(
                      image: logo,
                      width: MediaQuery.of(context).size.width / 2)),
              const Expanded(
                  flex: 1, child: CircularProgressIndicator.adaptive())
            ],
          ),
        ),
      ),
    );
  }
}
