import 'package:url_launcher/url_launcher.dart';

Future<bool> urlLauncherOpen(String url) async {
  try {
    if (await launchUrl(Uri.parse(url))) {
      return await launchUrl(Uri.parse(url));
    }
  } catch (e) {
    print(e);
  }
  return false;
}
