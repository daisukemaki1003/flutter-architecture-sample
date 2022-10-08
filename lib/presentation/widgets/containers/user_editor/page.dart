import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:man_memo_v2/presentation/widgets/components/user_editor/page.dart';

import '../../../../domain/entity/enum/holiday.dart';
import '../../../../domain/entity/model/holiday.dart';
import '../../../providers/users/holiday_model.dart';
import '../../../providers/users/user_state.dart';

class UserEditorPageContainer extends ConsumerWidget {
  const UserEditorPageContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        final name = ref.watch(userNameProvider.state);
        final age = ref.watch(userAgeProvider.state);
        final birthday = ref.watch(userBirthdayProvider.state);
        final birthplace = ref.watch(userBirthplaceProvider.state);
        final residence = ref.watch(userResidenceProvider.state);

        final occupation = ref.watch(userOccupationProvider.state);
        final memo = ref.watch(userMemoProvider.state);

        return UserEditorPageComponent(
          name: name.state,
          age: age.state,
          birthday: birthday.state,
          birthplace: birthplace.state,
          residence: residence.state,
          occupation: occupation.state,
          memo: memo.state,
        );
      },
    );
  }
}
