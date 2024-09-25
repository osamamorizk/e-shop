import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection time out');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send time out');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Recevive time out');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Connection Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'Connection Error');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errorMessage: 'No Internet Connection');
        }
        return ServerFailure(
            errorMessage: 'Unexpected Error, Please try again!');
      default:
        return ServerFailure(
            errorMessage: 'Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic responce) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: responce);
    } else if (statusCode == 404) {
      return ServerFailure(
          errorMessage: 'Your request not found, please try again later');
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessage: 'Internal server error, please try again later');
    } else {
      return ServerFailure(errorMessage: 'Oops tray again');
    }
  }
}
