import 'package:url_launcher/url_launcher.dart';

/// Thin wrapper around url_launcher so widgets never call it directly.
class UrlLauncherUtil {
  UrlLauncherUtil._();

  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri, webOnlyWindowName: '_blank');
  }

  static Future<void> openEmail(String email, {String subject = '', String body = ''}) async {
    final queryParts = <String>[
      if (subject.isNotEmpty) 'subject=${Uri.encodeComponent(subject)}',
      if (body.isNotEmpty) 'body=${Uri.encodeComponent(body)}',
    ];
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      query: queryParts.isEmpty ? null : queryParts.join('&'),
    );
    await launchUrl(uri);
  }

  static Future<void> openPhone(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone.replaceAll(' ', ''));
    await launchUrl(uri);
  }

  static Future<void> downloadCv() async {
    await openUrl('assets/assets/cv/cv.pdf');
  }
}
