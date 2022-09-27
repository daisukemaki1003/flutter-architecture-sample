import 'package:flutter/material.dart';

import '../../../container/user_editor/page.dart';

class EditButtonComponent extends StatelessWidget {
  const EditButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.6),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(8),
        ),
        child: const Icon(
          Icons.more_horiz,
          color: Colors.black54,
          size: 25,
        ),
        onPressed: () {
          /// 編集画面へ
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => const UserEditorPageContainer(),
            ),
          );
        },
      ),
    );
  }
}
