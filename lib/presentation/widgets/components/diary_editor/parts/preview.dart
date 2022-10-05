// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../diary_list/parts/user_icon_list.dart';
import 'markdown_body.dart';

class PreviewWidgetComponent extends StatelessWidget {
  const PreviewWidgetComponent({
    super.key,
    required this.createdAtIsDone,
    required this.createdAt,
    required this.userIds,
    required this.title,
    required this.body,
  });

  final bool createdAtIsDone;
  final DateTime createdAt;
  final List<int> userIds;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    const externalPaddingInset =
        EdgeInsets.symmetric(horizontal: 30, vertical: 20);
    const internalPaddingInset = EdgeInsets.only(left: 20, right: 20, top: 10);
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日');

    return SingleChildScrollView(
      child: Padding(
        padding: externalPaddingInset,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (createdAtIsDone)
              Center(child: Text(outputFormat.format(createdAt))),
            Padding(
              padding: internalPaddingInset,
              child: UserIconListWidget(users: userIds, height: 50),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 20),
              child: Column(
                children: [
                  MarkdownBodyContainer(
                    markdownSource: "## $title \n$body",
                    onCopyRequested: (String value) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
