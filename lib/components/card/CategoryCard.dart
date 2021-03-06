import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard(
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
              onTap(category, title);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(
                    height: 200,
                    image: NetworkImage(imageURL),
                    fit: BoxFit.cover),
                ListTile(
                    title: Text(title,
                        style: Typography.material2018().dense.headline5))
              ],
            )));
  }
}
