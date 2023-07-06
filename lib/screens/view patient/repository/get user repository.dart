import '../../../models/users.dart';
import '../viewpatient_services.dart';



class PatientRepository{
   final Getuserservices getuserservices;

   PatientRepository(this.getuserservices);
   Future<List<dynamic>>getAllusers()async{
     final users = await getuserservices.getAllusers();
     return users.map((user) => User.fromJson(user)).toList();

   }

}