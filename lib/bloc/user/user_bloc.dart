import 'package:equatable/equatable.dart';
import 'package:fifth_month/data/local/db.dart';
import 'package:fifth_month/data/models/status.dart';
import 'package:fifth_month/data/models/user_keys.dart';
import 'package:fifth_month/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(UserState(
          currentUser: UserModel(
              firstname: "", lastname: "", age: 0, gender: "", jobTitle: ""),
          users: [],
          status: FormStatus.pure,
          statusText: "",
        )) {
    on<AddUser>(_addUser);
    on<GetUsers>(_getUsers);
    on<DeleteUser>(_deleteUser);
    on<UpdateUser>(_updateUser);
  }

  _addUser(AddUser event, Emitter<UserState> emit) async {
    print(event.userModel.toString());
    emit(state.copyWith(status: FormStatus.loading, statusText: "Loading..."));
     await LocalDatabase.insertUser(event.userModel);
    // if (theUser.id != null) {
      emit(state.copyWith(
          status: FormStatus.success, statusText: "User added!"));
    // } else {
    //   emit(state.copyWith(
    //       status: FormStatus.failure, statusText: "Error occurred!"));
    // }
  }

  _updateUser(UpdateUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: "Loading..."));
    await LocalDatabase.updateUser(newUser: event.userModel);
    emit(state.copyWith(
        statusText: "The user is updated!", status: FormStatus.success));
  }

  _getUsers(GetUsers event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: "Loading..."));
    List<UserModel> theUsers = await LocalDatabase.getAllUsers();
    debugPrint("USERS: $theUsers");
    if (theUsers.isNotEmpty) {
      emit(state.copyWith(
          statusText: "Users fetched!!!",
          status: FormStatus.success,
          users: theUsers));
    } else {
      emit(state.copyWith(status: FormStatus.failure, statusText: "Failed"));
    }
  }

  _deleteUser(DeleteUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(statusText: "Loading...", status: FormStatus.loading));
    // if (theId > 0) {
      emit(state.copyWith(
          status: FormStatus.success, statusText: "The user is deleted!"));
    // } else {
    //   emit(state.copyWith(statusText: "Failed", status: FormStatus.failure));
    // }
  }

  updateUserFields({required UserKeys keys, required dynamic value}) {
    UserModel user = state.currentUser;
    switch (keys) {
      case UserKeys.firstname:
        user = user.copyWith(firstname: value);
        break;
      case UserKeys.lastname:
        user = user.copyWith(lastname: value);
        break;
      case UserKeys.age:
        user = user.copyWith(age: value);
        break;
      case UserKeys.gender:
        user = user.copyWith(gender: value);
        break;
      case UserKeys.job:
        user = user.copyWith(jobTitle: value);
        break;
    }
    debugPrint(state.currentUser.toString());
    emit(state.copyWith(currentUser: user));
  }
}
