import 'dart:convert';
import 'package:currency_app/app/constants.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<dynamic> get(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    var url = Uri.parse('${Constants.baseUrl}/$endPoint');
    if (queryParameters != null) {
      url = url.replace(queryParameters: queryParameters);
    }
    print("Url = $url");
    final response = await http.get(
      url,
      headers: {
        'Content-type': Constants.content_type,
        'Accept': Constants.Accept,
      },
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Request failed with status code ${response.statusCode}');
    }
  }
}
