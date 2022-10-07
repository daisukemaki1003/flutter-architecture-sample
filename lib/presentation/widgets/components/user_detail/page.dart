import 'package:flutter/material.dart';

import '../../../providers/users/users.dart';
import '../../containers/diary_list/parts/diary_list.dart';
import '../../containers/user_detail/parts/profile_bar.dart';
import '../../containers/user_detail/parts/profile_widget.dart';

import 'parts/tab_bar.dart';

class UserDetailPageComponent extends StatelessWidget {
  const UserDetailPageComponent({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 230, 255),
      body: DefaultTabController(
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
                  snap: false,

                  /// ユーザープロフィールBar
                  flexibleSpace: ProfileBarContainer(user),

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
              ProfileWidgetContainer(user),

              /// 日記一覧
              DiaryListContainer(user),
            ],
          ),
        ),
      ),
    );
  }
}
