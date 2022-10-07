import 'package:flutter/material.dart';

class EditStringPege extends StatelessWidget {
  const EditStringPege(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          "title",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: Navigator.of(context).pop,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('保存'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: TextField(
          controller: controller,
          style: const TextStyle(fontSize: 18),
          decoration: const InputDecoration(
            hintText: 'ユーザーIDを入力してください',
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            suffixIcon: Icon(
              Icons.cancel,
              color: Colors.grey,
              size: 20,
            ),
            suffixIconConstraints: BoxConstraints(minWidth: 10, minHeight: 10),
          ),
        ),
      ),
    );
  }
}
