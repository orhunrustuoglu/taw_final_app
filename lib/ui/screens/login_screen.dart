import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taw_final_app/data/constants/constant_images.dart';
import 'package:taw_final_app/ui/providers/auth_provider.dart';
import 'package:taw_final_app/ui/widgets/custom_button.dart';
import 'package:taw_final_app/ui/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = "login-screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  var emailController = TextEditingController(text: "admin@admin.com");
  var passwordController = TextEditingController(text: "123456");

  //we dispose of the controllers to clear up the ram
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Image(
                  image: logo,
                  height: 150,
                ),
                const SizedBox(height: 100),
                CustomTextField(
                    controller: emailController,
                    iconData: Icons.email,
                    hintText: "Email"),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: passwordController,
                    iconData: Icons.password,
                    hintText: "Password"),
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomButton(
                    text: "Login",
                    isLoading: isLoading,
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await Provider.of<AuthProvider>(context, listen: false)
                          .logInEmailPassword(context, emailController.text,
                              passwordController.text);
                      //if failed, then the state is still mounted
                      if (mounted) {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
