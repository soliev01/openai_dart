import 'package:openai_dart/src/configuration.dart';

/// Convert [Configuration] to authentication header
Map<String, String> authHeader({required Configuration config}) {
  return {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${config.apiKey}'
  };
}
