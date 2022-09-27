import 'package:flutter/material.dart';

import 'markdown_body.dart';

class PreviewWidget extends StatelessWidget {
  const PreviewWidget(this.markdownSource, {super.key});

  final String markdownSource;

  @override
  Widget build(BuildContext context) {
    const externalPaddingInset = EdgeInsets.all(8);
    const internalPaddingInset =
        EdgeInsets.symmetric(horizontal: 50, vertical: 30);

    return SingleChildScrollView(
      child: Padding(
        padding: externalPaddingInset,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: internalPaddingInset,
              child: MarkdownBodyContainer(
                markdownSource: markdownSource,
                onCopyRequested: (String value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
