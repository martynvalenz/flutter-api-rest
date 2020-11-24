import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationApi {
  final Dio _dio = new Dio();
  final Logger _logger = new Logger();

  Future<void> register({
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

    } 
    catch (e) {
      _logger.e(e);

    }
    
  }
}