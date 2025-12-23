import 'package:dio/dio.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/end_ponits.dart';

class ApiInterceptor extends Interceptor {
  final List<String> publicEndpoints = ['user/login', 'user/register'];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheHelper().getData(key: ApiKey.token);

    final isPublicEndpoint = publicEndpoints.any(
      (endpoint) => options.path.startsWith(endpoint),
    );

    print('>>> INTERceptor DEBUG <<<');
    print('Request Path: ${options.path}');
    print('Is Public: $isPublicEndpoint');
    print('Token Exists: ${token != null}');
    if (token != null && !isPublicEndpoint) {
      print('>>> TOKEN WILL BE ADDED! <<<');
      options.headers['Authorization'] = 'Bearer $token';
    } else {
      print('>>> TOKEN WILL NOT BE ADDED! <<<');
    }
    print('-------------------------');

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('--- ERROR ---');
    print('Error: ${err.message}');
    print('Response Data: ${err.response?.data}');
    print('-------------');
    super.onError(err, handler);
  }
}
