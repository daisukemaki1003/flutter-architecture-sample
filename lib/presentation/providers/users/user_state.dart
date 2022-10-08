import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entity/enum/occupation.dart';
import '../../../domain/entity/enum/prefectures.dart';
import '../../../domain/entity/model/holiday.dart';
import 'holiday_model.dart';
import 'user_model.dart';

/// 新規ユーザー
final userProvider = Provider((ref) {
  final name = ref.watch(userNameProvider.state);
  final createdAt = ref.watch(userCreatedAtProvider.state);
  final icon = ref.watch(userIconProvider.state);
  final age = ref.watch(userAgeProvider.state);
  final birthday = ref.watch(userBirthdayProvider.state);
  final birthplace = ref.watch(userBirthplaceProvider.state);
  final residence = ref.watch(userResidenceProvider.state);
  final holiday = ref.watch(userHolidayProvider);
  final occupation = ref.watch(userOccupationProvider.state);
  final memo = ref.watch(userMemoProvider.state);

  return UserModel(
    createdAt: createdAt.state,
    name: name.state.text,
    icon: icon.state,
    age: age.state,
    birthday: birthday.state,
    birthplace: birthplace.state,
    residence: residence.state,
    holiday: holiday,
    occupation: occupation.state,
    memo: memo.state.text,
  );
});

final userCreatedAtProvider = StateProvider<DateTime>((_) => DateTime.now());
final userNameProvider =
    StateProvider<TextEditingController>((_) => TextEditingController());
final userIconProvider = StateProvider<String>((_) => "");
final userAgeProvider = StateProvider<int>((_) => -1);
final userBirthdayProvider = StateProvider<String>((_) => "");
final userBirthplaceProvider =
    StateProvider<PrefecturesEnum>((_) => PrefecturesEnum.unknown);
final userResidenceProvider =
    StateProvider<PrefecturesEnum>((_) => PrefecturesEnum.unknown);
final userOccupationProvider =
    StateProvider<OccupatioEenum>((_) => OccupatioEenum.unknown);
final userMemoProvider =
    StateProvider<TextEditingController>((_) => TextEditingController());

/// パラメータクリア
clearUserAddFormParams(WidgetRef ref) {
  ref.watch(userCreatedAtProvider.state).state = DateTime.now();
  ref.watch(userNameProvider.state).state.clear();
  ref.watch(userIconProvider.state).state = "";
  ref.watch(userAgeProvider.state).state = -1;
  ref.watch(userBirthdayProvider.state).state = "";
  ref.watch(userBirthplaceProvider.state).state = PrefecturesEnum.unknown;
  ref.watch(userResidenceProvider.state).state = PrefecturesEnum.unknown;
  // ref.watch(userHolidayProvider.notifier).setHoliday(Holiday());
  ref.watch(userOccupationProvider.state).state = OccupatioEenum.unknown;
  ref.watch(userMemoProvider.state).state.clear();
}
