import 'package:drawer_ui/widget/main_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => MainDrawer.openDrawer(context),
            icon: const Icon(Icons.menu)),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
