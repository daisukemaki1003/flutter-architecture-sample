// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/model/user_detail.dart';
import 'package:man_memo_v2/presentation/provider/users/user_action_provider.dart';

import '../model/user.dart';
import '../widgets/card.dart';

class UserDetailScreen extends ConsumerWidget {
  const UserDetailScreen(this.user, {super.key});

  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200 + kToolbarHeight,
          floating: true,
          // pinned: true,
          snap: true,
          actions: [_showUserDetail()],

          /// User detail
          flexibleSpace: _userDetailBar(ref),
        ),

        // SafeArea(
        //   child: AnimationLimiter(
        //     child: ListView.builder(
        //       padding: const EdgeInsets.all(8.0),
        //       itemCount: 100,
        //       itemBuilder: (BuildContext context, int index) {
        //         return AnimationConfiguration.staggeredList(
        //           position: index,
        //           duration: const Duration(milliseconds: 375),
        //           child: SlideAnimation(
        //             verticalOffset: 44.0,
        //             child: FadeInAnimation(
        //               child: EmptyCard(
        //                 width: MediaQuery.of(context).size.width,
        //                 height: 88.0,
        //               ),
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),

        AnimationLimiter(
          child: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 100,
              (BuildContext context, int index) {
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

        /// Diary list
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (context, index) {
        //       return ListTile(title: Text('Item #$index'));
        //     },
        //     childCount: 100,
        //   ),
        // ),
      ],
    );
  }

  /// ユーザー詳細
  Widget _userDetailBar(WidgetRef ref) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: FutureBuilder(
        future: ref.watch(usersActionsProvider).getDetail(user),
        builder: (context, AsyncSnapshot<UserDetailModel> snapshot) {
          if (snapshot.hasData) {
            return UserDetailBar(snapshot.data!);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  /// ユーザー詳細へ遷移
  Widget _showUserDetail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.6),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(8),
        ),
        child: const Icon(
          Icons.app_blocking,
          color: Colors.black54,
          size: 16,
        ),
        onPressed: () {},
      ),
    );
  }
}

class UserDetailBar extends StatelessWidget {
  const UserDetailBar(this.userDetail, {super.key});

  final UserDetailModel userDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 名前
                Text(
                  userDetail.userBase.name,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                /// 登録日
                Text(
                  DateFormat('登録日 yyyy年M月d日')
                      .format(userDetail.userBase.createdAt),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          /// アイコン
          _userIconButton(),
        ],
      ),
    );
  }

  Widget _userIconButton() {
    return RawMaterialButton(
      onPressed: () {},
      child: CircleAvatar(
        radius: 35,
        backgroundImage: const NetworkImage(
            "https://gws-ug.jp/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png"),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Stack(
            alignment: Alignment.center,
            children: const [
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.blue,
              ),
              Icon(
                Icons.add,
                color: Colors.white,
                size: 14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
