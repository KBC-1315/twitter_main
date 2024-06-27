import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/gestures.dart';

class TextSpanWithLink extends TextSpan {
  TextSpanWithLink({
    required String text,
    required Uri url,
    TextStyle? style,
  }) : super(
          text: text,
          style: style ??
              const TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              _launchURL(url);
            },
        );
}

void _launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
