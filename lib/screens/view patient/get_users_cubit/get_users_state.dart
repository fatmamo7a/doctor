part of 'get_users_cubit.dart';

@immutable
abstract class GetUsersState {

}

class GetUsersInitial extends GetUsersState {

}
class UsersLoaded extends GetUsersState{
  final List<dynamic> Patients;

  UsersLoaded(this.Patients);
}