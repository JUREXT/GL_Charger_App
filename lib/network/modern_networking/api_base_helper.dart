import 'dart:io';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'app_exceptions.dart';

class ApiBaseHelper {
  final tag = "ApiBaseHelper";
  final String _baseUrl = Constants().getBaseUrl();
  Client client = http.Client();

  Future<dynamic> get(String url) async {
    var mTag = "Http Get";
    var urlPath = _baseUrl + url;
    Log.d(tag, '$mTag, url $urlPath');
    var responseJson;
    try {
      Response response = await client.get(urlPath, headers: headers());
      responseJson = _returnResponse(response, mTag);
    } on SocketException {
      Log.d(tag, '$mTag, No network');
      throw FetchDataException('No Internet connection');
    }
    Log.d(tag, '$mTag, Completed');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    var mTag = "Http Post";
    var urlPath = _baseUrl + url;
    Log.d(tag, '$mTag, url $urlPath');
    var responseJson;
    try {
      Response response = await http.post(urlPath, headers: headers(), body: body);
      responseJson = _returnResponse(response, mTag);
    } on SocketException {
      Log.d(tag, '$mTag, No network');
      throw FetchDataException('No Internet connection');
    }
    Log.d(tag, '$mTag, Completed');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    var mTag = "Http Put";
    var urlPath = _baseUrl + url;
    Log.d(tag, '$mTag, url $urlPath');
    var responseJson;
    try {
      Response response = await http.put(urlPath, headers: headers(), body: body);
      responseJson = _returnResponse(response, mTag);
    } on SocketException {
      Log.d(tag, '$mTag, No network');
      throw FetchDataException('No Internet connection');
    }
    Log.d(tag, '$mTag, Completed');
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var mTag = "Http Delete";
    var urlPath = _baseUrl + url;
    Log.d(tag, '$mTag, url $urlPath');
    var apiResponse;
    try {
      Response response = await http.delete(urlPath, headers: headers());
      apiResponse = _returnResponse(response, mTag);
    } on SocketException {
      Log.d(tag, '$mTag, No network');
      throw FetchDataException('No Internet connection');
    }
    Log.d(tag, '$mTag, Completed');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response, String tag) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      Log.d(tag, responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString()); // TODO: maybe map every error into json
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

headers() {
  return <String, String> {
    'Content-Type': 'application/json; charset=UTF-8',
  };
}
