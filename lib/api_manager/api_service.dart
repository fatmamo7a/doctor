import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../common/pref_manager.dart';
import 'api_url.dart';

extension SplitByLength on String {
  List<String> splitByLength1(int length, {bool ignoreEmpty = false}) {
    List<String> pieces = [];

    for (int i = 0; i < this.length; i += length) {
      int offset = i + length;
      String piece = substring(i, offset >= this.length ? this.length : offset);

      if (ignoreEmpty) {
        piece = piece.replaceAll(RegExp(r'\s+'), '');
      }

      pieces.add(piece);
    }
    return pieces;
  }

  bool get canSendToSearch {
    if (isEmpty) false;

    return split(' ').last.length > 2;
  }

  int get numberOnly {
    final regex = RegExp(r'\d+');

    final numbers =
        regex.allMatches(this).map((match) => match.group(0)).join();

    try {
      return int.parse(numbers);
    } on Exception {
      return 0;
    }
  }
}

var loggerObject = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    // number of method calls to be displayed
    errorMethodCount: 0,
    // number of method calls if stacktrace is provided
    lineLength: 300,
    // width of the output
    colors: true,
    // Colorful log messages
    printEmojis: false,
    // Print an emoji for each log message
    printTime: false,
  ),
);

typedef OnUploadProgressCallback = void Function(int sentBytes, int totalBytes);

class APIService {
  static APIService _singleton = APIService._internal();

  factory APIService.reInitial() {
    _singleton = APIService._internal();
    return _singleton;
  }

  factory APIService() => _singleton;

  final innerHeader = {
    'Content-Type': 'application/json',
    'Accept': 'Application/json',
    'Authorization': '${PreferenceManager.getInstance()?.getString('token')??''}',
  };

  APIService._internal();

  Future<http.Response> getApi({
    required String url,
    Map<String, dynamic>? query,
    Map<String, List<dynamic>>? listQuery,
    Map<String, String>? header,
    String? path,
  }) async {
    url = additionalConst + url;
    query = query ?? {};
    query.removeWhere((key, value) => value == null);
    query.forEach((key, value) => query![key] = value.toString());

    innerHeader.addAll(header ?? {});

    if (path != null) url = '$url/$path';

    var uri = Uri.https(baseUrl, url, query);

    var s = uri.query.isEmpty ? '' : '&';
    if (listQuery != null) {
      listQuery.forEach(
        (key, value) {
          for (var e in value) {
            s += '$key=${e.toString()}&';
          }
        },
      );
      var q = '${uri.query}$s';
      uri = uri.replace(query: q);
    }
    logRequest(url, query, additional: s);
    final response = await http.get(uri, headers: innerHeader).timeout(
          const Duration(seconds: 40),
          onTimeout: () => http.Response('connectionTimeOut', 481),
        );

    logResponse(url, response);
    return response;
  }

  Future<http.Response> getApiFromUrl({
    required String url,
  }) async {
    url = additionalConst + url;
    var uri = Uri.parse(url);

    logRequest(url, null);
    final response = await http.get(uri, headers: innerHeader).timeout(
          const Duration(seconds: 40),
          onTimeout: () => http.Response('connectionTimeOut', 481),
        );

    logResponse(url, response);
    return response;
  }

  Future<http.Response> postApi({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, String>? header,
    String? path,
  }) async {
    url = additionalConst + url;
    if (body != null) {
      body.removeWhere(
          (key, value) => value == null || (value is String && value.isEmpty));
    }
    query = query ?? {};
    query.removeWhere((key, value) => value == null);
    query.forEach((key, value) => query![key] = value.toString());

    innerHeader.addAll(header ?? {});
    if (path != null) url = '$url/$path';

    final uri = Uri.https(baseUrl, url, query);

    logRequest(url, body?..addAll(query));

    final response = await http
        .post(uri, body: jsonEncode(body), headers: innerHeader)
        .timeout(
          const Duration(seconds: 40),
          onTimeout: () => http.Response('connectionTimeOut', 481),
        );

    logResponse(url, response);

    return response;
  }

  Future<http.Response> puttApi({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, String>? header,
  }) async {
    url = additionalConst + url;
    if (body != null) body.removeWhere((key, value) => value == null);
    query = query ?? {};
    query.removeWhere((key, value) => value == null);
    query.forEach((key, value) => query![key] = value.toString());

    innerHeader.addAll(header ?? {});
    final uri = Uri.https(baseUrl, url, query);

    logRequest(url, body);

    final response = await http
        .put(uri, body: jsonEncode(body), headers: innerHeader)
        .timeout(
          const Duration(seconds: 40),
          onTimeout: () => http.Response('connectionTimeOut', 481),
        );

    logResponse(url, response);

    return response;
  }

  Future<http.Response> deleteApi({
    required String url,
    String? path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, String>? header,
  }) async {
    url = additionalConst + url;
    if (body != null) body.removeWhere((key, value) => value == null);
    query = query ?? {};
    query.removeWhere((key, value) => value == null);
    query.forEach((key, value) => query![key] = value.toString());

    if (path != null) url = '$url/$path';

    innerHeader.addAll(header ?? {});
    final uri = Uri.https(baseUrl, url, query);

    logRequest(url, body);

    final response = await http
        .delete(uri, body: jsonEncode(body), headers: innerHeader)
        .timeout(
          const Duration(seconds: 40),
          onTimeout: () => http.Response('connectionTimeOut', 481),
        );

    logResponse(url, response);

    return response;
  }

  Future<http.Response> uploadMultiPart({
    required String url,
    String? path,
    String? nameKey,
    String type = 'POST',
    List<String>? files,
    Map<String, dynamic>? fields,
    Map<String, String>? header,
  }) async {
    url = additionalConst + url;
    Map<String, String> f = {};
    (fields ?? {}).forEach((key, value) => f[key] = value.toString());

    final uri = Uri.https(baseUrl, url);

    var request = http.MultipartRequest(type, uri);

    ///log
    logRequest(url, fields, additional: files?.first);

    for (String path in files ?? []) {
      if (path.isEmpty) continue;

      final multipartFile =
          await http.MultipartFile.fromPath(nameKey ?? "File", path);

      request.files.add(multipartFile);
    }

    request.headers.addAll(innerHeader);

    request.headers['Content-Type'] = 'multipart/form-data';

    request.fields.addAll(f);

    final stream = await request.send().timeout(
          const Duration(seconds: 40),
          onTimeout: () => http.StreamedResponse(Stream.value([]), 481),
        );

    final response = await http.Response.fromStream(stream);

    ///log
    logResponse(url, response);

    return response;
  }

  void logRequest(String url, Map<String, dynamic>? q, {String? additional}) {
    var msg = url;
    if (q != null) msg += '\n ${jsonEncode(q)}';
    if (additional != null) msg += '\n $additional';

    loggerObject.i(msg);
  }

  void logResponse(String url, http.Response response) {
    var r = [];
    var res = '';
    if (response.body.length > 800) {
      r = response.body.splitByLength1(800);
      for (var e in r) {
        res += '$e\n';
      }
    } else {
      res = response.body;
    }

    loggerObject.v('${response.statusCode} \n $res');
  }
}
