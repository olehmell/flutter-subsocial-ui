import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> postJsonRequest({String url, dynamic data}) async {
  final body = json.encode(data);

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  final response = await http.post(url, body: body, headers: headers);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  }
  throw Exception('Error with status code ${response.statusCode}');
}
