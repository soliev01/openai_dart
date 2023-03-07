import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:openai_dart/openai_dart.dart';
import 'package:openai_dart/src/configuration.dart';
import 'package:openai_dart/src/utils.dart';

/// Exception that occurs while making an `http` request.
class HttpException implements Exception {}

/// {@template http_request_failure}
/// Thrown if an `http` request returns a non-200 status code.
/// {@endtemplate}
class HttpRequestFailure implements Exception {
  /// {@macro http_request_failure}
  const HttpRequestFailure(this.statusCode);

  /// The status code of the response.
  final int statusCode;
}

/// Thrown when an error occurs while decoding the response body.
class JsonDecodeException implements Exception {}

/// Thrown when an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {}

/// {@template openai_dart}
/// A Dart API Client for OpenAI REST API.
/// More info at https://api.openai.com
/// {@endtemplate}
class OpenAI {
  /// {@macro openai}
  OpenAI({required Configuration configuration, http.Client? httpClient})
      : _configuration = configuration,
        _httpClient = httpClient ?? http.Client();

  /// The host url for OpenAI APIs.
  static const authority = 'api.openai.com';
  final Configuration _configuration;
  final http.Client _httpClient;

  final StreamController<Completion> _controller = StreamController();

  /// Ceates a chat compeltion request where response is Stream of [Completion]
  Stream<Completion> createChatCompletion({
    required ChatCompletionRequest completionRequest,
  }) async* {
    final http.StreamedResponse response;

    try {
      response = await _httpClient.send(
        http.Request('POST', Uri.https(authority, 'v1/chat/completions'))
          ..headers.addAll(authHeader(config: _configuration))
          ..body = jsonEncode(completionRequest.toJson()),
      );
    } catch (_) {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestFailure(response.statusCode);
    }

    response.stream.listen((value) {
      final text = utf8.decode(value);
      if (text.contains('[DONE]')) {
        _controller.close();
        _httpClient.close();
        return;
      }
      try {
        _controller.add(
          Completion.fromJson(
            jsonDecode(text.substring(text.indexOf('{')))
                as Map<String, dynamic>,
          ),
        );
      } catch (_) {
        _controller.close();
        _httpClient.close();
        throw JsonDecodeException();
      }
    });

    yield* _controller.stream;
  }
}
