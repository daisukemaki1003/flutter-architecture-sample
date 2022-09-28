import 'package:flutter/material.dart';

class UserAddButtonComponent extends StatelessWidget {
  const UserAddButtonComponent(this.addUser, {super.key});

  final Function() addUser;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await addUser();
      },
      child: Container(
        height: 54,
        width: 54,
        margin: const EdgeInsets.only(right: 17, bottom: 50),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add, size: 25, color: Colors.white),
      ),
    );
  }
}
