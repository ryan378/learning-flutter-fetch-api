import 'package:bloc/bloc.dart';
import 'package:feed_app/user-list/cubit/user_list_state.dart';

class UserRemove extends Cubit<UserListState> {
  UserRemove() : super(const UserListState.initial());

  void removeUser(int id) {
    final currentState = state;
    if (currentState is UserListSuccess) {
      final updatedUsers =
          currentState.users.where((user) => user.id != id).toList();
      emit(UserListState.success(updatedUsers));
    }
  }
}
