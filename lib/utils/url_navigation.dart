import 'package:flutter/cupertino.dart';
import 'package:gl_charge_app/components/simple_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

 class UrlNavigation {
  static navigateTo(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      simpleSnackBar(context, "Web page can't be opened currently!");
    }
  }
}
