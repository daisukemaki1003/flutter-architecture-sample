import 'dart:ffi';

import 'package:flutter/material.dart';

import 'parts/edit_select_tile.dart';
import 'parts/edit_string_page.dart';
import 'parts/edit_string_tile.dart';

class UserEditorPageComponent extends StatelessWidget {
  const UserEditorPageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          "プロフィール編集",
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 30, right: 0),
        child: ListView(
          children: const [
            EditStringTile(
              item: "身長",
              itemValue: "175cm",
              fontSize: 15,
              editPege: EditStringPege(),
            ),
            EditStringTile(
              item: "身長",
              itemValue: "175cm",
              fontSize: 15,
              editPege: EditStringPege(),
            ),
            EditStringTile(
              item: "身長",
              itemValue: "175cm",
              fontSize: 15,
              editPege: EditStringPege(),
            ),
            EditSelectTile(
              item: "身長",
              itemValue: "175cm",
              fontSize: 15,
              editSheet: EditStringPege(),
            ),
          ],
        ),
      ),
    );
  }
}
