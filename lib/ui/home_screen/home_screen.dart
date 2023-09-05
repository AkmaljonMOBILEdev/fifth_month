import 'package:fifth_month/bloc/user/user_bloc.dart';
import 'package:fifth_month/data/models/status.dart';
import 'package:fifth_month/data/models/user_model.dart';
import 'package:fifth_month/ui/add_screen/add_screen.dart';
import 'package:fifth_month/ui/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddUserScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocConsumer<UserBloc, UserState>(
        builder: (context, state) {
          if (state.statusText == "Users fetched!!!" &&
              state.status == FormStatus.success) {
            return state.users.isNotEmpty
                ? Stack(
                    children: [
                      ListView.separated(
                        itemBuilder: (context, index) {
                          UserModel theUser = state.users[index];
                          return ListTile(
                            onTap: () {
                              debugPrint("LENGTH: ${state.users.length}");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UserDetailScreen(user: theUser)));
                            },
                            title: Text(
                              "${theUser.firstname} ${theUser.lastname}",
                              style: const TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(theUser.age.toString()),
                            trailing: IconButton(
                              onPressed: () {
                                context.read<UserBloc>().add(
                                    DeleteUser(id: state.users[index].id!));
                                // context.read<UserBloc>().add(GetUsers());
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10.h,
                          );
                        },
                        itemCount: state.users.length,
                      ),
                      Visibility(
                          visible: state.status == FormStatus.loading,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ))
                    ],
                  )
                : const Center(
                    child: Text(
                      "Empty data!",
                      style: TextStyle(color: Colors.black),
                    ),
                  );
          } else {
            return Center(
              child: Text(state.statusText),
            );
          }
        },
        listener: (context, state) {
          // if(state.status==FormStatus.loading&&state.statusText=="Loading..."){
          //   showLoading(context: context);
          // }
          // if(state.status==FormStatus.success&&(state.statusText=="User added!" || state.statusText=="Users fetched!!!")){
          //   hideLoading(context: context);
          // }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          BlocProvider.of<UserBloc>(context).add(GetUsers());
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(
          Icons.get_app,
          color: Colors.white,
        ),
      ),
    );
  }
}
