import 'package:dio/dio.dart';

extension SuccessResponse on Response {
  bool get isSuccessful => statusCode! >= 200 && statusCode! <= 300;
}
