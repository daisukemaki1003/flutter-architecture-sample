// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../widgets/card.dart';

class DiaryListScreen extends StatelessWidget {
  const DiaryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日記', style: TextStyle(color: Colors.black)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
        ),
      ),
      body: SafeArea(
        child: AnimationLimiter(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 44.0,
                  child: FadeInAnimation(
                    child: EmptyCard(
                      width: MediaQuery.of(context).size.width,
                      height: 88.0,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
