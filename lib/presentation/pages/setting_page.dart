import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home/home_model.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      // body: const Center(child: Text('設定', style: TextStyle(fontSize: 32.0))),
      body: Center(
        child: homeViewModel.when(
            data: (data) {
              return Column(
                children: data.users!.map((e) => Text(e.name)).toList(),
              );
            },
            error: (error, trace) => Text(
                  error.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
