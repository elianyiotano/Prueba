import 'package:dio/dio.dart';
import 'package:jogo_mobile_app/constants/constants.dart';
import 'package:jogo_mobile_app/main.dart';
import 'package:jogo_mobile_app/services/auth.service.dart';

class ParkingSessionService {
  final Dio _dio = Dio();

  Future<Response> getList(context) async {
    try {
      AuthService authService = MyApp.of(context).authService;
      Response response =
          await _dio.get(ApiConstants.baseUrl + ApiConstants.getListEvents,
              options: Options(
                headers: {
                  "Authorization": authService.token_auth,
                },
              ));
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> search(context, String id) async {
    try {
      AuthService authService = MyApp.of(context).authService;
      Response response =
          await _dio.post(ApiConstants.baseUrl + ApiConstants.getEvent,
              options: Options(headers: {
                "Authorization": authService.token_auth,
              }),
              data: {"id": id});

      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> ranking(context) async {
    try {
      AuthService authService = MyApp.of(context).authService;
      Response response =
          await _dio.get(ApiConstants.baseUrl + ApiConstants.getRanking,
              options: Options(
                headers: {
                  "Authorization": authService.token_auth,
                },
              ));
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }
}
