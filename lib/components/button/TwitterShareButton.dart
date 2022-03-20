import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TwitterShareButton extends StatelessWidget {
  final String text;
  final String label;
  final String url;
  final List<String> hashtags;
  final String via;
  final String related;

  const TwitterShareButton(
      {Key? key,
      required this.text,
      required this.label,
      this.url = "",
      this.hashtags = const [],
      this.via = "",
      this.related = ""})
      : super(key: key);

  void _tweet() async {
    final Map<String, dynamic> tweetQuery = {
      "text": this.text,
      "url": this.url,
      "hashtags": this.hashtags.join(","),
      "via": this.via,
      "related": this.related,
    };

    final Uri tweetScheme =
        Uri(scheme: "twitter", host: "post", queryParameters: tweetQuery);

    final Uri tweetIntentUrl =
        Uri.https("twitter.com", "/intent/tweet", tweetQuery);

    await canLaunch(tweetScheme.toString())
        ? await launch(tweetScheme.toString())
        : await launch(tweetIntentUrl.toString());
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        _tweet();
      },
      icon: const Icon(MdiIcons.twitter),
      label: Text(label, style: Typography.dense2018.bodyText1),
    );
  }
}
