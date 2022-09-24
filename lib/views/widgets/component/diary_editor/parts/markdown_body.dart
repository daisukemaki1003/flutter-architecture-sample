import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownBodyContainer extends StatelessWidget {
  final String markdownSource;
  final Function(String) onCopyRequested;

  const MarkdownBodyContainer({
    Key? key,
    required this.markdownSource,
    required this.onCopyRequested,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      selectable: true,
      shrinkWrap: true,
      data: markdownSource,
      styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
          .copyWith(textScaleFactor: 1.5),
      onTapLink: (_, url, __) {},
    );
  }
}
