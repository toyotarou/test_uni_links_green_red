import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

import '../screens/green_screen.dart';
import '../screens/red_screen.dart';
import '../utility/context_utility.dart';

mixin UniLinksService {
  static String _code = '';

  static String get code => _code;

  static bool get hasCode => _code.isNotEmpty;

  ///
  static void reset() {
    _code = '';
  }

  ///
  static Future<void> init() async {
    try {
      final uri = await getInitialUri();
      uniHandler(uri);
    } on PlatformException {
      log('failed to receive the code');
    } on FormatException {
      log('wrong format code received');
    }

    uriLinkStream.listen((Uri? uri) async {
      print('bbbbbbbb');
      print(uri);
      print('bbbbbbbb');

      uniHandler(uri);
    }, onError: (dynamic error) => log('OnUriLink error: $error'));
  }

  ///
  static void uniHandler(Uri? uri) {
    if (uri == null || uri.queryParameters.isEmpty) {
      return;
    }

    final param = uri.queryParameters;

    final receivedCode = param['code'] ?? '';

    print('aaaaaaaa');
    print(receivedCode);
    print('aaaaaaaa');

    if (receivedCode == 'green') {
      Navigator.push(ContextUtility.context!, MaterialPageRoute(builder: (context) => const GreenScreen()));
    } else {
      Navigator.push(ContextUtility.context!, MaterialPageRoute(builder: (context) => const RedScreen()));
    }
  }
}
