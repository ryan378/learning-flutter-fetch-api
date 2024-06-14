import 'package:feed_app/user-list/cubit/user_list_cubit.dart';
import 'package:feed_app/user-list/cubit/user_list_state.dart';
import 'package:feed_app/user-list/cubit/user_remove.dart';
import 'package:feed_app/view/user_list_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserListCubit, UserListState>(
        builder: (context, state) {
          if (state is UserListSuccess) {
            // Success: Display the list directly
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: Text(
                      user.title.substring(0, 1).toUpperCase(),
                    ),
                  ),
                  title: Text(user.title),
                  subtitle: Text(
                    user.body.length > 40
                        ? user.body.substring(0, 40) + '...'
                        : user.body,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context.read<UserListCubit>().removeUser(user.id);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserDetailPage(user: user),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            // Handle other states (loading, error, etc.)
            if (state is UserListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserListError) {
              return Center(child: Text(state.errorMessage));
            } else {
              // Initial state or unexpected state: Trigger fetching
              context.read<UserListCubit>().fetchUser();
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}
