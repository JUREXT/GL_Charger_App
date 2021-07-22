import 'dart:io';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'app_exceptions.dart';

class ApiBaseHelper {
  final String _baseUrl = Constants().getBaseUrl();

  Future<dynamic> get(String url) async {
    print('Api Get, url $_baseUrl + $url');
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No network');
      throw FetchDataException('No Internet connection');
    }
    print('Api Get Received!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    print('Api Post, url $_baseUrl + $url');
    var responseJson;
    try {
      final response = await http.post(_baseUrl + url, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No network');
      throw FetchDataException('No Internet connection');
    }
    print('Api Post Completed!');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $_baseUrl + $url');
    var responseJson;
    try {
      final response = await http.put(_baseUrl + url, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No network');
      throw FetchDataException('No Internet connection');
    }
    print('Api Put Completed!');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $_baseUrl + $url');
    var apiResponse;
    try {
      final response = await http.delete(_baseUrl + url);
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No network');
      throw FetchDataException('No Internet connection');
    }
    print('Api Delete Completed!');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
