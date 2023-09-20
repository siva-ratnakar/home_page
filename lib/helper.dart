import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class PlatformHelper {
  static get isWebMobile =>
      kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
}

class LinksHelper {
  static openInNewTab(String url) async {
    final link = Uri.parse(url);
    if (!await launchUrl(link)) {
      throw Exception('Could not launch $link');
    }
  }
}
