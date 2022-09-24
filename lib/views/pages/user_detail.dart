// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_detail.dart';
import '../models/user.dart';
import '../../presentation/provider/users/user_action_provider.dart';

class UserDetailScreen extends ConsumerStatefulWidget {
  const UserDetailScreen(this.user, {super.key});

  final UserModel user;

  @override
  UserDetailScreenState createState() => UserDetailScreenState();
}

class UserDetailScreenState extends ConsumerState<UserDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          controller: _controller,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  expandedHeight: 200 + kToolbarHeight,
                  floating: true,
                  snap: true,
                  actions: [
                    /// ユーザー編集へ遷移
                    _userDetailsButton(),
                  ],

                  /// ユーザープロフィール
                  flexibleSpace: profileBar(),

                  /// タブ
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(48),
                    child: Stack(
                      children: [
                        /// 詳細と日記
                        _buildTabTitles(),

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
              userDetailWidget(ref),

              /// 日記一覧
              userDetailWidget(ref),
              // const MyDiaryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget userDetailWidget(WidgetRef ref) {
    return FutureBuilder(
      future: ref.watch(userActionsProvider).getDetail(widget.user),
      builder: (context, AsyncSnapshot<UserDetailModel> snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        } else {
          final userDetail = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              children: [
                _userDetailTile(
                  "基本情報",
                  {
                    "名前": userDetail!.userBase.name,
                    "年齢": userDetail.age.toString(),
                    "誕生日": userDetail.birthday,
                    "出身地": userDetail.birthplace,
                    "居住地": userDetail.residence,
                  },
                ),
                _userDetailTile(
                  "仕事",
                  {
                    "職種": userDetail.occupation,
                    "休日": userDetail.holiday.toString(),
                  },
                ),
                _userDetailTile(
                  "メモ",
                  {
                    "メモ": userDetail.memo,
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _userDetailTile(String title, Map<String, String> userDatas) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: userDatas.entries
                  .map((e) => profileWidget(e.key, e.value))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget profileWidget(String key, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              key,
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              softWrap: true,
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// プロフィールバー
  Widget profileBar() {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 90),
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
                  _userName(),

                  /// 登録日
                  userRegistrationDate(),
                ],
              ),
            ),

            /// アイコン
            _userIconButton(),
          ],
        ),
      ),
    );
  }

  /// 名前
  Widget _userName() {
    return Text(
      widget.user.name,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  /// 登録日時
  Widget userRegistrationDate() {
    return Text(
      DateFormat('登録日 yyyy年M月d日').format(widget.user.createdAt),
      style: const TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
    );
  }

  /// アイコンボタン
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

  // タブの左寄せタイトル郡
  Widget _buildTabTitles() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TabBar(
            indicator: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                width: 2,
                color: Colors.black,
              )),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              _tabTitle('詳細'),
              _tabTitle('日記'),
            ],
          ),
        ),
        Expanded(flex: 2, child: Container()),
      ],
    );
  }

  Widget _tabTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SizedBox(
        height: 40,
        width: 132,
        child: Tab(text: title),
      ),
    );
  }

  /// タブの右寄せアクション郡
  Widget _buildTabActions() {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              child: const Icon(Icons.sort_outlined),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  /// ユーザー詳細へ遷移
  Widget _userDetailsButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.6),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(8),
        ),
        child: const Icon(
          Icons.more_horiz,
          color: Colors.black54,
          size: 25,
        ),
        onPressed: () {},
      ),
    );
  }
}
