import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

int? responseStatusCode;

var baseUrl = 'https://dashboard.toyourgateexpress.com/api/v1/';

class HttpService {
  static Future httpPostCall(String endpoint, params) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var url = "${baseUrl.trim()}${endpoint.trim()}";
    try {
      var response =
          await http.post(Uri.parse(url), body: jsonEncode(params), headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      });
      log(response.body);
      log("${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401 || response.statusCode == 400) {
        throw jsonDecode(response.body)['message'];
      } else if (response.statusCode != 200 || response.statusCode != 201) {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

//patch request
  static Future httpPatchCall(String endpoint, params) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    var url = "${baseUrl.trim()}${endpoint.trim()}";
    try {
      var response =
          await http.patch(Uri.parse(url), body: jsonEncode(params), headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      });
      log(response.body);
      log("${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  //secure httpgetCall
  static Future httpGetCall(
    String endpoint,
  ) async {
    Duration timeoutDuration = Duration(seconds: 90);
    Completer<void> completer = Completer<void>();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var url = "${baseUrl.trim()}${endpoint.trim()}";
    var token = preferences.getString('token');
    try {
      var response = await http.get(Uri.parse(url), headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }).timeout(timeoutDuration);
      completer.complete();
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 202) {
        responseStatusCode = response.statusCode;
        return response.body;
      } else if (response.statusCode != 200) {
        responseStatusCode = response.statusCode;

        throw response.body;
      }
    } catch (e) {
      if (e is TimeoutException) {
        // Handle timeout scenario (e.g., throw custom timeout exception)
        throw ('HTTP request timed out',);
      } else {
        // Handle other types of exceptions
        print('Error during HTTP request: $e');
      }
      rethrow;
    }
  }

  // PUT REQUEST
  static Future httpPutCall(String endpoint, params) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var url = "${baseUrl.trim()}${endpoint.trim()}";
    var token = preferences.getString('token').toString();
    try {
      var response =
          await http.put(Uri.parse(url), body: jsonEncode(params), headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      });
      // log(response.body);
      log("${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future httpFileUploadCall(
    List<File> files,
    String endpoint,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var url = "${baseUrl.trim()}${endpoint.trim()}";
    var token = preferences.getString('token').toString();
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer $token';
      for (var file in files) {
        request.files.add(await http.MultipartFile.fromPath('file', file.path));
      }

      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        print('Files uploaded successfully');
        print(responseData);
        return http.Response(responseData, response.statusCode);
      } else {
        print('Failed to upload files. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading files: $e');
    }
  }

  // DELETE REQUEST
  static Future httpDeleteCall(String endpoint, params) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var url = "${baseUrl.trim()}${endpoint.trim()}";
    var token = preferences.getString('token').toString();
    try {
      var response =
          await http.delete(Uri.parse(url), body: jsonEncode(params), headers: {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      });
      log(response.body);
      log("${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
