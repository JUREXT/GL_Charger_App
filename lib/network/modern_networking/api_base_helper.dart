import 'dart:io';
import 'package:gl_charge_app/utils/log.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';
import 'api_end_point.dart';
import 'api_response_resource.dart';
import 'app_exceptions.dart';

class ApiBaseHelper {
  final tag = "ApiBaseHelper";
  final String _baseUrl = Api_V1.BASE_URL_PRODUCTION;
  Client client = http.Client();

  Future<ApiResponseResource> get(String url, Map<String, String> header) async {
    var mTag = "Http Get";
    var urlPath = _baseUrl + url;
    Log.d(tag, '$mTag, url $urlPath');
    var apiResource = ApiResponseResource.negative("400");
    try {
      Response response = await client.get(urlPath, headers: header);
      apiResource = getApiResponseResourceWithDecodedJson(response, mTag);
    } on SocketException {
      Log.d(tag, '$mTag, No Internet connection');
      apiResource = ApiResponseResource.negative('No Internet connection');
    }
    Log.d(tag, '$mTag, Completed');
    return apiResource;
  }

  Future<dynamic> post(String url, dynamic body, Map<String, String> header) async {
    var mTag = "Http Post";
    var urlPath = _baseUrl + url;
    Log.d(tag, '$mTag, url $urlPath');
    var apiResource = ApiResponseResource.negative("400");
    try {
      Response response = await http.post(urlPath, body: body, headers: header);
      apiResource = getApiResponseResourceWithDecodedJson(response, mTag);
    } on SocketException {
      Log.d(tag, '$mTag, No Internet connection');
      apiResource = ApiResponseResource.negative('No Internet connection');
    } on Exception {
      apiResource = ApiResponseResource.negative('End Point Error');
    }
    Log.d(tag, '$mTag, Completed');
    return apiResource;
  }

  Future<dynamic> put(String url, dynamic body, Map<String, String> header) async {
    var mTag = "Http Put";
    var urlPath = _baseUrl + url;
    Log.d(tag, '$mTag, url $urlPath');
    var responseJson;
    try {
      Response response = await http.put(urlPath, headers: header, body: body);
      responseJson = getApiResponseResourceWithDecodedJson(response, mTag);
    } on SocketException {
      Log.d(tag, '$mTag, No network');
      throw FetchDataException('No Internet connection');
    }
    Log.d(tag, '$mTag, Completed');
    return responseJson;
  }

  Future<dynamic> delete(String url, Map<String, String> header) async {
    var mTag = "Http Delete";
    var urlPath = _baseUrl + url;
    Log.d(tag, '$mTag, url $urlPath');
    var apiResponse;
    try {
      Response response = await http.delete(urlPath, headers: header);
      apiResponse = getApiResponseResourceWithDecodedJson(response, mTag);
    } on SocketException {
      Log.d(tag, '$mTag, No network');
      throw FetchDataException('No Internet connection');
    }
    Log.d(tag, '$mTag, Completed');
    return apiResponse;
  }
}

ApiResponseResource getApiResponseResourceWithDecodedJson(http.Response response, String tag) {  // TODO: needs to be made better based on after some usage, to know what to change
  switch (response.statusCode) {
    case 200:
      var decodedJson = json.decode(response.body);
      Log.d(tag, decodedJson.toString());
      return ApiResponseResource.positive(decodedJson);
    case 400:
     // throw BadRequestException(response.body.toString());
      return ApiResponseResource.negative("400");
    case 401:
    case 403:
      //throw UnauthorisedException(response.body.toString());
    return ApiResponseResource.negative("401, 403");
    case 500:
    default:
     // throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    return ApiResponseResource.negative("500");
  }

}