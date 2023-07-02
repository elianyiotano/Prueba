import 'package:dio/dio.dart';
import 'package:jogo_mobile_app/constants/constants.dart';
import 'package:jogo_mobile_app/main.dart';
import 'package:jogo_mobile_app/services/auth.service.dart';

class QrService {
  final Dio _dio = Dio();

  Future<Response> search(context, String barcode) async {
    try {
      AuthService authService = MyApp.of(context).authService;
      Response response =
          await _dio.post(ApiConstants.baseUrl + ApiConstants.postQr,
              options: Options(headers: {
                "Authorization": "Bearer " + authService.token_auth,
              }),
              data: {"barcode": barcode});

      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

}
