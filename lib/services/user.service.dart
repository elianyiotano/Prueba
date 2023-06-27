import 'package:dio/dio.dart';
import 'package:jogo_mobile_app/constants/constants.dart';
import 'package:jogo_mobile_app/main.dart';
import 'package:jogo_mobile_app/services/auth.service.dart';

class UserService {
  final Dio _dio = Dio();

  Future<Response> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        ApiConstants.baseUrl + ApiConstants.singInEndpoint,
        data: {'email': email, 'password': password},
      );
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> create(String email, String password,
      String name, String phone ) async {
    try {
      Response response = await _dio.post(
        ApiConstants.baseUrl + ApiConstants.singUpEndpoint,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone
        },
      );
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> getUserProfileData(context) async {
    try {
      AuthService authService = MyApp.of(context).authService;
      Response response =
          await _dio.post(ApiConstants.baseUrl + ApiConstants.getUser,
              options: Options(headers: {
                "Authorization": authService.token_auth,
              }));

      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<dynamic> logout() async {
    throw Exception("no implementado");
  }

  Future<dynamic> forgotPassword(context, String email) async {
    try {
      AuthService authService = MyApp.of(context).authService;
      String url = ApiConstants.baseUrl + ApiConstants.sendResetPasswordEmail;
      Response response = await _dio.post(url,
          options: Options(
            headers: {
              "Authorization": authService.token_auth,
            },
          ),
          data: {"redirect_url": "", "email": email});
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }
}
