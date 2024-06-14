import 'package:bloc/bloc.dart';
import 'package:feed_app/user-list/cubit/user_list_state.dart';
import 'package:feed_app/user-list/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserListCubit extends Cubit<UserListState> {
  UserListCubit() : super(const UserListState.initial());

  Future<void> fetchUser() async {
    try {
      emit(const UserListState.loading());
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<User> users =
            data.map<User>((json) => User.fromJson(json)).toList();
        emit(UserListState.success(users));
      } else {
        emit(UserListState.error("Error loading data: ${response.body}"));
      }
    } catch (e) {
      emit(UserListState.error("Error loading data: ${e.toString()}"));
    }
  }

  void removeUser(int id) {
    final currentState = state;
    if (currentState is UserListSuccess) {
      final updatedUsers =
          currentState.users.where((user) => user.id != id).toList();
      emit(UserListState.success(updatedUsers));
    }
  }
}
