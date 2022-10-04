import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_add_form.dart';

final userAddFormProvider = Provider((ref) {
  final name = ref.watch(nameProvider);
  return UserAddForm(name: name);
});

final nameProvider = StateProvider<String>((_) {
  return "name";
});
