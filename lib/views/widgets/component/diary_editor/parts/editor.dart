import 'package:flutter/material.dart';

class EditorWidget extends StatelessWidget {
  final String? content;
  final void Function(String text) onContentChanged;

  const EditorWidget({
    super.key,
    required this.content,
    required this.onContentChanged,
  });

  @override
  Widget build(BuildContext context) {
    const externalPaddingInset =
        EdgeInsets.symmetric(horizontal: 50, vertical: 30);
    const outlineInputBorder = InputBorder.none;

    return Expanded(
      child: Padding(
        padding: externalPaddingInset,
        child: TextFormField(
          decoration: const InputDecoration(
            border: outlineInputBorder,
          ),
          style: const TextStyle(fontSize: 20),
          initialValue: content,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: onContentChanged,
        ),
      ),
    );
  }
}
