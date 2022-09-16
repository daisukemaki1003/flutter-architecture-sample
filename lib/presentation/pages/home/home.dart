import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/drawer_header.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/user_list.dart';
import 'home_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.watch(homeViewModelProvider);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: const MyDrawerHeader(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            homeViewModel.when(
              error: (err, _) => Text(err.toString()),
              loading: () => const CircularProgressIndicator(),
              data: (data) => MyUserList(data.users!),
            ),
            const MySerachBar(),
          ],
        ),
      ),
    );
  }
}
