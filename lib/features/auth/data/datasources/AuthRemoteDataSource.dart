import '../../../../core/network/ApiEndpoints.dart';
import '../../../../core/network/api_client.dart';
import '../model/registerrequest.dart';

class Authremotedatasource {
  final ApiClient api;
  Authremotedatasource(this.api);

  Future<void> register(RegisterRequest request)async{

    await api.dio.post(
      Apiendpoints.register,
      data: request.toJson()
    );

  }

}