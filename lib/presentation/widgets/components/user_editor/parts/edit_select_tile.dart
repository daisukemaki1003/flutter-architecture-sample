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
      onTap: () async {
        final result = await showModalBottomSheet<bool>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return SizedBox(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _sheetHeaderButton(context, 'キャンセル', false),
                        _sheetHeaderButton(context, '保存', true),
                      ],
                    ),
                  ),
                  const Divider(height: 1, thickness: 1, color: Colors.black26),
                  Expanded(child: editSheet),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _sheetHeaderButton(BuildContext context, String text, bool saveOr) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: () => Navigator.of(context).pop(saveOr),
        child: Text(text,
            style: const TextStyle(
                color: Colors.lightBlue, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
