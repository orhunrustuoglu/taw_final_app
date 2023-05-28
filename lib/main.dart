import 'package:flutter/material.dart';
import 'package:taw_final_app/data/constants/constant_colors.dart';
import 'package:taw_final_app/ui/providers/auth_provider.dart';
import 'package:taw_final_app/ui/providers/budget_provider.dart';
import 'package:taw_final_app/ui/screens/add_cost_screen.dart';
import 'package:taw_final_app/ui/screens/edit_budget_screen.dart';
import 'package:taw_final_app/ui/screens/splash_screen.dart';
import '/ui/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

//design inspiration:
//https://www.behance.net/gallery/166750439/SPLITTY-Bill-splitting-mobile-app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<AuthProvider>(create: (_) => AuthProvider()),
        ListenableProvider<BudgetProvider>(create: (_) => BudgetProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: primaryColor,
            secondary: secondaryColor,
          ),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const SplashScreen(),
          MainScreen.routeName: (context) => const MainScreen(),
          EditBudgetScreen.routeName: (context) => const EditBudgetScreen(),
          AddCostScreen.routeName: (context) => const AddCostScreen(),
        },
      ),
    );
  }
}
