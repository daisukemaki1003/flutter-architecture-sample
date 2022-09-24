import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../container/diary_list/parts/diary_list.dart';
import '../../container/user_detail/parts/profile_bar.dart';
import '../../container/user_detail/parts/profile_widget.dart';
import 'parts/edit_button.dart';
import 'parts/tab_bar.dart';

class UserDetailPageComponent extends StatelessWidget {
  const UserDetailPageComponent({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  expandedHeight: 200 + kToolbarHeight,
                  floating: true,
                  snap: true,
                  // pinned: true,
                  actions: const [
                    /// ユーザー編集へ遷移
                    EditButtonComponent(),
                  ],

                  /// ユーザープロフィールBar
                  flexibleSpace: const ProfileBarContainer(),

                  /// タブ
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(48),
                    child: Stack(
                      children: const [
                        /// 詳細と日記
                        TabBarComponent(),

                        /// 並び替えとフィルターのactions
                        // _buildTabActions()
                      ],
                    ),
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              /// ユーザー詳細
              const ProfileWidgetContainer(),

              /// 日記一覧
              DiaryListContainer(user: user),
            ],
          ),
        ),
      ),
    );
  }
}
