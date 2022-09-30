import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAddForm {
  final String name;
  UserAddForm({required this.name});
}

final userAddFormProvider = Provider((ref) {
  final name = ref.watch(nameProvider);
  return UserAddForm(name: name);
});

final nameProvider = StateProvider<String>((_) {
  return "name";
});
