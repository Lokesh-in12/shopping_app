import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioExceptions implements Exception {
  String? message;
  DioExceptions.fromDioErr(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to Api Server was cancelled";
        break;
      case DioErrorType.connectionTimeout:
        message = "Connection Timeout with Api Server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive Timeout with Api Server";
        break;
      case DioErrorType.badResponse:
        message = _handleError(
            dioError.response?.statusCode, dioError.response?.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send Timeout in Connection with Api Server";
        break;
      case DioErrorType.connectionTimeout:
        message = "Connection Timeout with Api Server";
        break;

      default:
        message = "Something went wrong";
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return error['message'];
      case 500:
        return 'Internal Server Error';
      case 522:
        return 'Connection Timeout with Api';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message!;
}
