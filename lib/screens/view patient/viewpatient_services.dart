import 'package:dio/dio.dart';
import 'package:doctor_application/shared/remote/dio_helper.dart';

class Getuserservices{
  late Dio dio;
  Getuserservices(){
    BaseOptions options = BaseOptions(
      baseUrl: 'http://160.20.146.238/',
      receiveDataWhenStatusError: true,

    );
    dio = Dio(options);

  }
  Future<List<dynamic>>getAllusers()async{
    Response response = await dio.get('api?action=listRecords');
    try{
      print(response.data.toString());
      return response.data;
    }catch(e){
      print(e.toString());
      return[];
    }

  }

}