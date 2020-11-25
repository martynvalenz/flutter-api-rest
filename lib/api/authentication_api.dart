import 'package:dio/dio.dart';
import 'package:flutter_api_rest/helpers/http_response.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationApi {
  final Dio _dio = new Dio();
  final Logger _logger = new Logger();

  Future<HttpResponse> register({
    @required String username,
    @required String email,
    @required String password
  }) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final res = await _dio.post(
        'https://curso-api-flutter.herokuapp.com/api/v1/register',
        options: Options(
          headers:{
            'Content-type':'application/json',
          }
        ),
        data:{
          'username':username,
          'email':email,
          'password':password,
        }
      );
      return HttpResponse.success(res.data);
    } 
    catch (e) {
      _logger.e(e);

      int statusCode = -1;
      String message = 'Unknown error';
      dynamic data;

      if(e is DioError){
        message = e.message;
        if(e.response != null){
          statusCode = e.response.statusCode;
          message = e.response.statusMessage;
          data = e.response.data;
        }
      }

      return HttpResponse.fail(
        statusCode: statusCode,
        message: message,
        data: data
      );
    }
    
  }
}