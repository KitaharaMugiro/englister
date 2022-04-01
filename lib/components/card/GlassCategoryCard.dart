import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCategoryCard extends StatelessWidget {
  GlassCategoryCard(
      {Key? key,
      required this.onTap,
      required this.imageURL,
      required this.title,
      required this.category})
      : super(key: key);

  //Confirm: もう少し正確な型をつけたい
  Function onTap;
  String imageURL;
  String title;
  String category;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 250,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black45),
              child: const Text("aaa"),
            )));
    return Card(
        elevation: 3,
        child: InkWell(
            onTap: () {
              onTap(category, title);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(
                  image: NetworkImage(imageURL),
                ),
                ListTile(
                    title: Text(title,
                        style: Typography.material2018().dense.headline5))
              ],
            )));
  }
}
