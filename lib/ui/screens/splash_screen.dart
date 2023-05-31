import 'package:flutter/material.dart';
import 'package:taw_final_app/data/constants/constant_images.dart';
import 'package:taw_final_app/ui/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //
  // Future<void> serverOperations(BuildContext ctx) async {
  //   var authProvider = Provider.of<AuthProvider>(context, listen: false);
  //   await authProvider.retrieveToken().then((_) async {
  //     await authProvider.signInWithToken().then((_) {
  //       if (Provider.of<AuthProvider>(context, listen: false).getUser.id !=
  //           "") {
  //         Navigator.pushReplacementNamed(context, MainScreen.routeName);
  //       }
  //       Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
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
