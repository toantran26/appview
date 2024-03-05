import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void unFocusField(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  static void afterBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> openURL(String? url) async {
    if (url != null) {
      if (!await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    }
  }

  static Future<void> callPhone(String phone) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    await launchUrl(launchUri);
  }

  static Future<void> sendEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    launchUrl(emailLaunchUri);
  }

  static Future<void> sendSMS(String phone) async {
    String url = 'sms:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not send SMS to $url.';
    }
  }

  //  https://phatgiao.org.vn/cong-thong-tin-phat-giao-lot-top-1-xep-hang-website-co-noi-dung-ve-duc-tin-d56329.html
  static String getNewsIDFromURL(String url) {
    final arr = url.split('-');
    final rawID = arr[arr.length - 1];
    final id = rawID.replaceAll(RegExp(r'\D'), '');

    return id;
  }
}
