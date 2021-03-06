import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

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
    var finalText = text + "\n#" + hashtags.join(" #") + "\n" + url;

    Share.share(finalText);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        _tweet();
      },
      icon: Icon(
        MdiIcons.shareVariantOutline,
        color: Theme.of(context).cardColor,
      ),
      label: Text(label,
          style: TextStyle(
            fontSize: 17,
            color: Theme.of(context).cardColor,
          )),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).toggleableActiveColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
      ),
    );
  }
}
