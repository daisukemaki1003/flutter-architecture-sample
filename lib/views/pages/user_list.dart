// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// import '../models/user.dart';
// import '../../presentation/provider/users/user_action_provider.dart';
// import '../../presentation/provider/users/user_list_provider.dart';
// import 'search_results.dart';
// import 'user_detail.dart';

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         drawer: Drawer(
//           child: ListView(
//             children: const [
//               DrawerHeader(
//                 decoration: BoxDecoration(color: Colors.lightBlue),
//                 child: Text('Test App'),
//               )
//             ],
//           ),
//         ),
//         body: Stack(
//           fit: StackFit.expand,
//           children: [
//             Consumer(
//               builder: (context, ref, _) {
//                 final users = ref.watch(userListNotifierProvider);
//                 return users.map(
//                   error: (_) => const Text('On Error'),
//                   loading: (_) => const CircularProgressIndicator(),
//                   data: (data) => _userList(data.value),
//                 );
//               },
//             ),

//             Positioned(
//               right: 10,
//               bottom: 10,
//               child: _addButton(ref),
//             ),

//             /// 検索バー
//             const MySerachBar(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _userList(List<UserModel> users) {
//     return ListView(
//       children: [
//         const SizedBox(height: 100),
//         ListView.builder(
//           itemCount: users.length,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           scrollDirection: Axis.vertical,
//           itemBuilder: (BuildContext context, int index) {
//             final user = users[index];
//             return _userListItem(context, user);
//           },
//         ),
//       ],
//     );
//   }

//   Widget _userListItem(BuildContext context, UserModel user) {
//     return Slidable(
//       endActionPane: ActionPane(
//         extentRatio: 0.25,
//         motion: const DrawerMotion(),
//         children: [
//           SlidableAction(
//             label: 'Delete',
//             icon: Icons.delete,
//             backgroundColor: Colors.red,
//             foregroundColor: Colors.white,
//             onPressed: (BuildContext context) {
//               print("onDismissed");
//             },
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListTile(
//           leading: const CircleAvatar(
//             radius: 25,
//             backgroundImage: NetworkImage(
//                 "https://gws-ug.jp/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png"),
//           ),
//           title: Text(user.name),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return UserDetailScreen(user);
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _addButton(WidgetRef ref) {
//     return GestureDetector(
//       onTap: () {
//         ref.watch(userActionsProvider).add("name");
//         ref.refresh(userActionsProvider);
//       },
//       child: Container(
//         height: 54,
//         width: 54,
//         margin: const EdgeInsets.only(right: 17, bottom: 50),
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: const Icon(Icons.add, size: 25, color: Colors.white),
//       ),
//     );
//   }
// }
