import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard(
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
    return Card(
        elevation: 3,
        child: InkWell(
            onTap: () {
              onTap(category);
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
