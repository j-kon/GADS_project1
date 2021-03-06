import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestResources {
  final String _baseUrl = 'https://gadsapi.herokuapp.com/';
  final String _submitBaseUrl = 'https://docs.google.com/forms/d/e/';

  postSubmitData(data, url) async {
    var link = _submitBaseUrl + url;

    return await http.post(link, body: jsonEncode(data));
  }

  postData(data, url) async {
    var link = _baseUrl + url;

    return await http.post(link,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getResources(url) async {
    var link = _baseUrl + url;

    return await http.get(link, headers: _setHeaders());
  }

  _setHeaders() =>
      {'content-type': 'application/json', 'Accept': 'application/json'};
}
