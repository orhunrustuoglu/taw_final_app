import 'package:flutter/material.dart';

class AddCostScreen extends StatelessWidget {
  const AddCostScreen({super.key});
  static const routeName = "add-cost-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Cost"),
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.close)),
      ),
    );
  }
}
