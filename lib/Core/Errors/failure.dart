import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        // TODO: Handle this case.
        return ServerFailure('No connection!');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send Timeout!');
      case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        return ServerFailure('receive Timeout!');
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        return ServerFailure('bad Certificate!');
      case DioExceptionType.badResponse:
        // TODO: Handle this case.
        return ServerFailure.fromResponse(
          dioerror.response!.statusCode!,
          dioerror.response!.data,
        );
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        return ServerFailure('Response Cancelled ! ');
      case DioExceptionType.unknown:
        if (dioerror.message!.contains('SoketException')) {
          return ServerFailure('Unkown Error!');
        } else {
          return ServerFailure('unExpected Error !');
        }

      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 401) {
      return ServerFailure(response['error']['message']);
    } else if (statuscode == 404) {
      return ServerFailure('Your Request Not found ');
    } else if (statuscode == 500) {
      return ServerFailure('Enternal server error , please try again ! ');
    } else {
      return ServerFailure('There was an error !');
    }
  }
}

// class CacheFailure extends Failure {}
