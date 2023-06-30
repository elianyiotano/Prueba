import 'package:dio/dio.dart';
import 'package:jogo_mobile_app/constants/constants.dart';
import 'package:jogo_mobile_app/main.dart';

import 'package:jogo_mobile_app/services/auth.service.dart';

class MesageService {
  final Dio _dio = Dio();

  Future<Response> getList(context) async {
    try {
      AuthService authService = MyApp.of(context).authService;
      Response response =
          await _dio.get(ApiConstants.baseUrl + ApiConstants.getListMessage,
              options: Options(
                headers: {
                  "Authorization": "Bearer " + authService.token_auth,
                },
              ));
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }
}
