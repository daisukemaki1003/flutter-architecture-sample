import 'package:flutter/material.dart';

import '../../container/diary/parts/editor.dart';
import '../../container/diary/parts/preview.dart';

class DiaryEditor extends StatelessWidget {
  const DiaryEditor({super.key});

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
          title: const Text(
            "編集",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
            icon: backButtonIcon,
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            TextButton(
              child: const Text("保存", style: nabButtonTextStyle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DiaryEditor();
                    },
                  ),
                );
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
