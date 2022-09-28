import 'package:flutter/material.dart';

class UserEditorPageComponent extends StatelessWidget {
  const UserEditorPageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                labelText: '名前',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              keyboardType: TextInputType.number,
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                labelText: '年齢',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
                readOnly: true,
                cursorColor: Colors.black12,
                decoration: const InputDecoration(
                  labelText: '生年月日',
                  labelStyle: TextStyle(color: Colors.black),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 20),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
                onTap: () async {}),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                labelText: '出身地',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                labelText: '居住地',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          // const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              cursorColor: Colors.black12,
              decoration: InputDecoration(
                labelText: '職種',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              readOnly: true,
              cursorColor: Colors.black12,
              decoration: const InputDecoration(
                labelText: '休日',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
              onTap: () async {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'メモ',
                labelStyle: TextStyle(color: Colors.black),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.only(left: 20, top: -10, bottom: 3, right: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
