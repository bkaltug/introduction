import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w300,
        wordSpacing: 2,
        letterSpacing: 1);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          'Welcome',
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        shadowColor: Colors.transparent,
      ),
      body: Container(
        height: double.infinity,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  Theme.of(context).colorScheme.primary.withOpacity(0.2)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.4, 0.8])),
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 7.5,
            right: MediaQuery.of(context).size.width / 7.5,
            top: MediaQuery.of(context).size.height / 16),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: <TextSpan>[
            TextSpan(
                text:
                    "In my Github repositories you will find many apps built by me, ",
                style: textStyle),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchInBrowser(Uri.parse("https://github.com/bkaltug"));
                  },
                text: "@bkaltug",
                style: textStyle.copyWith(fontWeight: FontWeight.bold)),
            TextSpan(
                text:
                    ". However, you might encounter some repositories marked with certain labels.",
                style: textStyle),
            TextSpan(
                text: "\n\nAny applications marked with ", style: textStyle),
            TextSpan(
                text: "\"-lr\" ",
                style: textStyle.copyWith(fontWeight: FontWeight.bold)),
            TextSpan(
                text:
                    "label are the applications I built throughout my learning journey.",
                style: textStyle),
            TextSpan(
                text:
                    "\n\nSuch as this introductive application, any other applications marked with ",
                style: textStyle),
            TextSpan(
                text: "\"-LR\" ",
                style: textStyle.copyWith(fontWeight: FontWeight.bold)),
            TextSpan(
                text:
                    "label are the changed and improved versions of the applications I built throughout my learning journey.\n\nSo, ",
                style: textStyle),
            TextSpan(
                text: "welcome :)",
                style: textStyle.copyWith(fontWeight: FontWeight.bold)),
          ]),
        ),
      ),
    );
  }
}
