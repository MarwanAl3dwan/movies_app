import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            '[${e.response!.statusCode!}] Connection timeout with server.');
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            '[${e.response!.statusCode!}] Send timeout with server.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            '[${e.response!.statusCode!}] Receive timeout with server.');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            '[${e.response!.statusCode!}] Incorrect certificate with server.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response);
      case DioExceptionType.cancel:
        return ServerFailure(
            '[${e.response!.statusCode!}] Request to server was cancelled.');
      case DioExceptionType.connectionError:
        return ServerFailure(
            '[${e.response!.statusCode!}] There is no internet connection.');
      case DioExceptionType.unknown:
        {
          return ServerFailure(
              '[${e.response!.statusCode!}] Something went wrong. Please try again later!');
        }
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    String statusMessage =
        response['status_message'] ?? 'Unknown error occurred.';

    switch (statusCode) {
      case 1:
        return ServerFailure('[$statusCode] Success.');
      case 2:
        return ServerFailure(
            '[$statusCode] Invalid service: this service does not exist.');
      case 3:
        return ServerFailure(
            '[$statusCode] Authentication failed: You do not have permissions to access the service.');
      case 4:
        return ServerFailure(
            '[$statusCode] Invalid format: This service doesn\'t exist in that format.');
      case 5:
        return ServerFailure(
            '[$statusCode] Invalid parameters: Your request parameters are incorrect.');
      case 6:
        return ServerFailure(
            '[$statusCode] Invalid id: The pre-requisite id is invalid or not found.');
      case 7:
        return ServerFailure(
            '[$statusCode] Invalid API key: You must be granted a valid key.');
      case 8:
        return ServerFailure(
            '[$statusCode] Duplicate entry: The data you tried to submit already exists.');
      case 9:
        return ServerFailure(
            '[$statusCode] Service offline: This service is temporarily offline, try again later.');
      case 10:
        return ServerFailure(
            '[$statusCode] Suspended API key: Access to your account has been suspended, contact TMDB.');
      case 11:
        return ServerFailure(
            '[$statusCode] Internal error: Something went wrong, contact TMDB.');
      case 12:
        return ServerFailure(
            '[$statusCode] The item/record was updated successfully.');
      case 13:
        return ServerFailure(
            '[$statusCode] The item/record was deleted successfully.');
      case 14:
        return ServerFailure('[$statusCode] Authentication failed.');
      case 15:
        return ServerFailure('[$statusCode] Failed.');
      case 16:
        return ServerFailure('[$statusCode] Device denied.');
      case 17:
        return ServerFailure('[$statusCode] Session denied.');
      case 18:
        return ServerFailure('[$statusCode] Validation failed.');
      case 19:
        return ServerFailure('[$statusCode] Invalid accept header.');
      case 20:
        return ServerFailure(
            '[$statusCode] Invalid date range: Should be a range no longer than 14 days.');
      case 21:
        return ServerFailure(
            '[$statusCode] Entry not found: The item you are trying to edit cannot be found.');
      case 22:
        return ServerFailure(
            '[$statusCode] Invalid page: Pages start at 1 and max at 500. They are expected to be an integer.');
      case 23:
        return ServerFailure(
            '[$statusCode] Invalid date: Format needs to be YYYY-MM-DD.');
      case 24:
        return ServerFailure(
            '[$statusCode] Your request to the backend server timed out. Try again.');
      case 25:
        return ServerFailure(
            '[$statusCode] Your request count (#) is over the allowed limit of (40).');
      case 26:
        return ServerFailure(
            '[$statusCode] You must provide a username and password.');
      case 27:
        return ServerFailure(
            '[$statusCode] Too many append to response objects: The maximum number of remote calls is 20.');
      case 28:
        return ServerFailure(
            '[$statusCode] Invalid timezone: Please consult the documentation for a valid timezone.');
      case 29:
        return ServerFailure(
            '[$statusCode] You must confirm this action: Please provide a confirm=true parameter.');
      case 30:
        return ServerFailure(
            '[$statusCode] Invalid username and/or password: You did not provide a valid login.');
      case 31:
        return ServerFailure(
            '[$statusCode] Account disabled: Your account is no longer active. Contact TMDB if this is an error.');
      case 32:
        return ServerFailure(
            '[$statusCode] Email not verified: Your email address has not been verified.');
      case 33:
        return ServerFailure(
            '[$statusCode] Invalid request token: The request token is either expired or invalid.');
      case 34:
        return ServerFailure(
            '[$statusCode] The resource you requested could not be found.');
      case 35:
        return ServerFailure('[$statusCode] Invalid token.');
      case 36:
        return ServerFailure(
            '[$statusCode] This token hasn\'t been granted write permission by the user.');
      case 37:
        return ServerFailure(
            '[$statusCode] The requested session could not be found.');
      case 38:
        return ServerFailure(
            '[$statusCode] You don\'t have permission to edit this resource.');
      case 39:
        return ServerFailure('[$statusCode] This resource is private.');
      case 40:
        return ServerFailure('[$statusCode] Nothing to update.');
      case 41:
        return ServerFailure(
            '[$statusCode] This request token hasn\'t been approved by the user.');
      case 42:
        return ServerFailure(
            '[$statusCode] This request method is not supported for this resource.');
      case 43:
        return ServerFailure(
            '[$statusCode] Couldn\'t connect to the backend server.');
      case 44:
        return ServerFailure('[$statusCode] The ID is invalid.');
      case 45:
        return ServerFailure('[$statusCode] This user has been suspended.');
      case 46:
        return ServerFailure(
            '[$statusCode] The API is undergoing maintenance. Try again later.');
      case 47:
        return ServerFailure('[$statusCode] The input is not valid.');
      default:
        return ServerFailure('[$statusCode] $statusMessage');
    }
  }
}
