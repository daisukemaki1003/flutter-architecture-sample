import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/model/user_model.dart';

import '../presenter/users/user_add_presenter.dart';
import '../provider/users_provider.dart';
import '../widgets/drawer_header.dart';
import '../widgets/search_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userListStreamProvider);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: const MyDrawerHeader(),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: users.when(
                error: (err, _) => Text(err.toString()), //エラー時
                loading: () => const CircularProgressIndicator(), //読み込み時
                data: (data) => Text(data.toString()), //データ受け取り時
              ),
            ),

            _buildFloatingActionButton(),

            /// 追加ボタン
            // Positioned(
            //   right: 10,
            //   bottom: 10,
            //   child: _buildFloatingActionButton(),
            // ),
          ],
        ),

        // body: Stack(
        //   fit: StackFit.expand,
        //   children: [
        //     users.when(
        //       error: (err, _) => Text(err.toString()),
        //       loading: () => const CircularProgressIndicator(),
        //       data: (data) {
        //         return Stack(children: [
        //           /// ユーザーリスト
        //           _myUserList(data),

        //           /// 追加ボタン
        //           Positioned(
        //             right: 10,
        //             bottom: 10,
        //             child: _buildFloatingActionButton(),
        //           ),
        //         ]);
        //       },
        //     ),

        //     /// 検索バー
        //     const MySerachBar(),
        //   ],
        // ),
      ),
    );
  }

  Widget _myUserList(List<UserModel> users) {
    return ListView(
      children: [
        const SizedBox(height: 100),
        ListView.builder(
          itemCount: users.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final user = users[index];
            return _myUserListItem(user);
          },
        ),
      ],
    );
  }

  Widget _myUserListItem(UserModel user) {
    return Dismissible(
      key: ObjectKey(user),
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.redAccent[700],
      ),
      confirmDismiss: (DismissDirection direction) async {
        print("object");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                "https://gws-ug.jp/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png"),
          ),
          title: Text(user.name),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return GestureDetector(
      onTap: () {
        // homeViewModel.value!.add("name");
        UserAddPresenter().handle("name");
      },
      child: Container(
        height: 54,
        width: 54,
        margin: const EdgeInsets.only(right: 17, bottom: 50),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add, size: 25, color: Colors.white),
      ),
    );
  }
}
