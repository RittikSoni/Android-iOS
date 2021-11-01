import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  UrlLauncher({required this.url});
  String url;
  Future<void> launchInWebViewWithJavaScript() async {
    if (await canLaunch(
        // 'https://www.google.com/maps/place/Aastha+Hallmarking+Centre/@28.6556217,77.2312871,17z/data=!3m1!4b1!4m5!3m4!1s0x390cfd1b9790e28d:0xc7efea93ad77ada0!8m2!3d28.6556237!4d77.2333993'
        url)) {
      await launch(
          // 'https://www.google.com/maps/place/Aastha+Hallmarking+Centre/@28.6556217,77.2312871,17z/data=!3m1!4b1!4m5!3m4!1s0x390cfd1b9790e28d:0xc7efea93ad77ada0!8m2!3d28.6556237!4d77.2333993',
          url
          // forceSafariVC: true,
          // forceWebView: true,
          // enableJavaScript: true,
          // enableDomStorage: true,
          );
    } else {
      throw 'Could not launch';
    }
  }
}
