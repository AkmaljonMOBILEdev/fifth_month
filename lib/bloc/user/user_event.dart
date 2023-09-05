part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable{}

class AddUser extends UserEvent{
  final UserModel userModel;

  AddUser({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class GetUsers extends UserEvent{
  @override
  List<Object?> get props => [];
}

class UpdateUser extends UserEvent{
  final UserModel userModel;

  UpdateUser({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class DeleteUser extends UserEvent{
  final int id;
  DeleteUser({required this.id});
  @override
  List<Object?> get props => [id];
}