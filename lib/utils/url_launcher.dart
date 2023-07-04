import 'package:url_launcher/url_launcher.dart';

class UrlLuncher {
  //
  static Future<void> launch({
    required String scheme,
    required String path,
    LaunchMode launchMode = LaunchMode.platformDefault,
    Map<String, dynamic>? queryParams,
  }) async {
    await launchUrl(
      Uri(
        scheme: scheme,
        path: path,
        queryParameters: queryParams,
      ),
      mode: launchMode,
    );
  }
}
