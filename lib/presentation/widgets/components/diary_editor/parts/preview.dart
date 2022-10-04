// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../diary_list/parts/user_icon_list.dart';
import 'markdown_body.dart';

class PreviewWidgetComponent extends StatelessWidget {
  const PreviewWidgetComponent({
    super.key,
    required this.createdAt,
    required this.userIds,
    required this.title,
    required this.body,
  });

  final DateTime createdAt;
  final List<int> userIds;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    const externalPaddingInset =
        EdgeInsets.symmetric(horizontal: 30, vertical: 20);
    const internalPaddingInset =
        EdgeInsets.symmetric(horizontal: 20, vertical: 30);
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日');

    return SingleChildScrollView(
      child: Padding(
        padding: externalPaddingInset,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text(outputFormat.format(createdAt))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserIconListWidget(users: userIds, height: 50),
            ),
            Padding(
              padding: internalPaddingInset,
              child: Column(
                children: [
                  /// Title
                  MarkdownBodyContainer(
                    markdownSource: title,
                    onCopyRequested: (String value) {},
                  ),

                  /// Body
                  MarkdownBodyContainer(
                    markdownSource: body,
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
