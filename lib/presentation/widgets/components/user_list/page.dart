import 'package:flutter/material.dart';
import 'package:man_memo_v2/presentation/widgets/containers/user_list/parts/user_add_button.dart';
import 'package:man_memo_v2/presentation/widgets/containers/user_list/parts/user_list.dart';

import '../../containers/user_list/parts/user_list_serach_bar.dart';

class UserListPageComponent extends StatelessWidget {
  const UserListPageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.lightBlue),
                child: Text('Test App'),
              )
            ],
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: const [
            /// ユーザーリスト
            UserListContainer(),

            /// ユーザー追加ボタン
            Positioned(
              right: 10,
              bottom: 10,
              child: UserAddButtonContainer(),
            ),

            /// 検索バー
            SerachBarContainer(),
          ],
        ),
      ),
    );
  }
}
