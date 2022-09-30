import 'package:flutter/material.dart';

class EditSelectTile extends StatelessWidget {
  const EditSelectTile({
    super.key,
    required this.item,
    required this.itemValue,
    required this.fontSize,
    required this.editSheet,
  });

  final String item;
  final String itemValue;
  final double fontSize;
  final Widget editSheet;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item,
        style: TextStyle(fontSize: fontSize),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(
          itemValue,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.blue,
          ),
        ),
      ),
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return editSheet;
          },
        );
      },
    );
  }
}
