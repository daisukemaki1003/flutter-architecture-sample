// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../containers/diary/parts/editor.dart';
import '../../containers/diary/parts/preview.dart';

class DiaryEditorComponent extends StatelessWidget {
  const DiaryEditorComponent({
    super.key,
    required this.title,
    required this.save,
  });

  final String title;
  final Function() save;

  @override
  Widget build(BuildContext context) {
    final appBarBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    const nabButtonTextStyle = TextStyle(color: Colors.black);
    const backButtonIcon = Icon(Icons.arrow_back_ios, color: Colors.black);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarBackgroundColor,
          title: Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
            icon: backButtonIcon,
            onPressed: Navigator.of(context).pop,
          ),
          actions: [
            TextButton(
              child: const Text("保存", style: nabButtonTextStyle),
              onPressed: () async {
                await save();
                Navigator.of(context).pop();
              },
            ),
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(child: Text("編集", style: nabButtonTextStyle)),
              Tab(child: Text("プレビュー", style: nabButtonTextStyle)),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            EditorWidgetContainer(),
            PreviewWidgetContainer(),
          ],
        ),
      ),
    );
  }
}
