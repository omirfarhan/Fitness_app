import '../../../../core/network/ApiEndpoints.dart';
import '../../../../core/network/api_client.dart';
import '../model/registerrequest.dart';

class Authremotedatasource {
  final ApiClient api;
  Authremotedatasource(this.api);

  Future<dynamic> register(RegisterRequest request)async{

    try{
      final response =await api.dio.post(
          Apiendpoints.register,
          data: request.toJson()
      );
      // print('register response: ${response.data}');
      // print('register response: ${response.statusCode}');
      return response.data;
    }catch (e){
      print('Unexpected error $e');
      rethrow;
    }
  }

}