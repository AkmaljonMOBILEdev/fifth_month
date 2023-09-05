part of 'user_bloc.dart';

@immutable
class UserState extends Equatable {
  final List<UserModel> users;
  final UserModel currentUser;
  final FormStatus status;
  final String statusText;

   const UserState({
    required this.currentUser,
    required this.users,
    required this.status,
    required this.statusText,
  });

  UserState copyWith({
    UserModel?  currentUser,
    String? statusText,
    FormStatus? status,
    List<UserModel>? users,
  }) {
    return UserState(
      currentUser: currentUser??this.currentUser,
      users: users ?? this.users,
      status: status ?? this.status,
      statusText: statusText ?? this.statusText,
    );
  }
  @override
  String toString() {
    return currentUser.toString();
  }


  @override
  List<Object?> get props => [users, status, statusText, currentUser];
}
