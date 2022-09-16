import 'package:flutter/material.dart';

class MyDrawerHeader extends Drawer {
  const MyDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.lightBlue),
            child: Text('Test App'),
          )
        ],
      ),
    );
  }
}
