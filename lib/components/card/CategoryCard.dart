import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(void Function() this.launchURL, {Key? key})
      : super(key: key);
  final launchURL;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            elevation: 3,
            child: InkWell(
                onTap: launchURL,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Image(
                      image: NetworkImage(
                          'https://assets.media-platform.com/bi/dist/images/2021/03/19/black-w960.jpeg'),
                    ),
                    ListTile(
                        title: Text('Englister Free',
                            style: Typography.material2018().dense.headline5))
                  ],
                ))));
  }
}
