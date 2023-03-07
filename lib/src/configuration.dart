/// The configuration class for the **OpenAI** API.
///
/// It is required to provide an **API key** to
/// use the API and the **Organization ID** is optional.
///
/// For more information, see the OpenAI API documentation (https://beta.openai.com/docs/api-reference/authentication).
class Configuration {
  /// Constructor [Configuration]
  const Configuration({required this.apiKey, this.organizationId});

  /// The API key to authenticate request.
  final String apiKey;

  /// Organziation ID
  final String? organizationId;
}
