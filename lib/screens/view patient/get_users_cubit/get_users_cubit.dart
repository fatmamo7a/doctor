import 'package:bloc/bloc.dart';
import 'package:doctor_application/screens/view%20patient/repository/get%20user%20repository.dart';
import 'package:meta/meta.dart';

import '../../../models/users.dart';


part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {

  final PatientRepository patientRepository;
   late List<User>users;


  GetUsersCubit(this.patientRepository) : super(GetUsersInitial());
  List<dynamic>getAllusers(){
    patientRepository.getAllusers().then((patients){emit(UsersLoaded(patients)); patients = users;});
    return users;

}

}
