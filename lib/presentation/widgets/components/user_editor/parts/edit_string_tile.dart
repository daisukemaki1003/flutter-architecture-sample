import 'package:flutter/material.dart';

/// ToThePageForEditingStrings
class EditStringTile extends StatelessWidget {
  const EditStringTile({
    super.key,
    required this.item,
    required this.itemValue,
    required this.fontSize,
    // required this.onTapFunc,
    required this.editPege,
  });

  final String item;
  final String itemValue;
  final double fontSize;
  // final void Function() onTapFunc;
  final Widget editPege;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item,
        style: TextStyle(fontSize: fontSize),
      ),
      trailing: Wrap(
        spacing: 10,
        alignment: WrapAlignment.end,
        runAlignment: WrapAlignment.end,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            itemValue,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.blue,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return editPege;
            },
          ),
        );
      },
    );
  }
}
