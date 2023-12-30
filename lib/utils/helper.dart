import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:siva_website/professional/professional.dart';
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

/// Singleton class that provides single scroll controller
/// used by - [ProfessionalPage]
class ProfessionalScreenHelper {
  factory ProfessionalScreenHelper() {
    return _professionalScreenHelper;
  }
  static final _professionalScreenHelper = ProfessionalScreenHelper._internal();

  ProfessionalScreenHelper._internal();

  final scrollController = FixedExtentScrollController();
}
