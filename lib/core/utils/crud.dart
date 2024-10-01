import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:lock_doctors/core/networking/api_erorr_handler.dart';

import '../erorr/exception.dart';

String _basicAuth = 'Basic ${base64Encode(utf8.encode("osama:osama1234"))}';

Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  final Dio dio;

  Crud({required this.dio});

  Future<Map> postData(String link, Map<String, dynamic> data) async {
    try {
      // Making a POST request using Dio
      var response = await dio.post(
        link,
        data: data,
        options: Options(
          contentType: "application/x-www-form-urlencoded",
        ),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.data}');

      if (response.statusCode == ResponseCode.SUCCESS ||
          response.statusCode == ResponseCode.NO_CONTENT) {
        Map responseBody = jsonDecode(response.data);
        print(responseBody);
        return responseBody;
      } else {
        // Handle the error based on the response code
        throw ErrorHandler.handle(
          DioException(
            response: response,
            requestOptions: response.requestOptions,
          ),
        );
      }
    } catch (e) {
      // Use ErrorHandler to manage exceptions and rethrow with a proper message
      final serverException = ErrorHandler.handle(e).serverException;
      print('Handled error: ${serverException.message}');
      throw serverException.message; // Rethrow with the handled error message
    }
  }

  Future<Map> multiPostData(File imageFile, String link, Map data) async {
    final url = Uri.parse(link);
    var request = http.MultipartRequest('POST', url)
      ..fields['name'] = data["name"] // إضافة الاسم كحقل نصي
      ..files.add(await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
      ));
    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      var decodedResponse = jsonDecode(responseBody);
      print(decodedResponse);
      final res = decodedResponse;
      return res;
    } else {
      throw ServerException(message: "Server Error");
    }
  }

  Future<Map> multiListPostData(
      List<File> imageFiles, String link, Map data) async {
    final url = Uri.parse(link);
    var request = http.MultipartRequest('POST', url)
      ..fields['name'] = data["name"]; // Add the name as a text field

    for (var imageFile in imageFiles) {
      request.files.add(await http.MultipartFile.fromPath(
        'images',
        imageFile.path,
      ));
    }

    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      var decodedResponse = jsonDecode(responseBody);
      print(decodedResponse);
      final res = decodedResponse;
      return res;
    } else {
      throw Exception("Server Error");
    }
  }

  // Future<Either<StatusRequest, Map>> postDataPayment(
  //   String linkurl,
  //   Map data,
  // ) async {
  //   if (await checkInternet()) {
  //     var response = await http.post(Uri.parse(linkurl),
  //         body: jsonEncode(data),
  //         headers: {'Content-Type': 'application/json'});
  //     print(response.statusCode);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       Map responsebody = jsonDecode(response.body);
  //       print(responsebody);

  //       return right(responsebody);
  //     } else {
  //       return const Left(StatusRequest.serverfailure);
  //     }
  //   } else {
  //     return const Left(StatusRequest.offlinefaliure);
  //   }
  // }
}
