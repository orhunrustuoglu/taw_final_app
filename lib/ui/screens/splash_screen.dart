import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taw_final_app/data/constants/constant_images.dart';
import 'package:taw_final_app/ui/providers/auth_provider.dart';
import 'package:taw_final_app/ui/providers/budget_provider.dart';
import 'package:taw_final_app/ui/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //first, fetch the user data
    Provider.of<AuthProvider>(context, listen: false)
        .getUserData()
        .then(
            //then, fetch budget data of fetched user
            (_) => Provider.of<BudgetProvider>(context, listen: false)
                .getBudgetData())
        .then(
            //last, navigate to the main screen
            //TODO remove delayed when db connected
            (_) => Future.delayed(
                const Duration(seconds: 1),
                () => Navigator.pushReplacementNamed(
                    context, MainScreen.routeName)));
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
