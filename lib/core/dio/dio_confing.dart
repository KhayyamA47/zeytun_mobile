import 'package:dio/dio.dart';
import 'interceptor.dart';

final clientDio = Dio()
  ..options = BaseOptions(
    baseUrl: 'https://appzeytunpharm.az/api/',
  )
  ..interceptors.add(DioInterceptor());
// Options optionMethod() {
//   return Options(
//       contentType: 'application/json',
//       followRedirects: false,
//       validateStatus: (status) => true,
//       headers: {
//         "Accept": "application/json",
//         "Content-Type": "application/json"
//       });
// }
