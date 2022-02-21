import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:englister/components/card/MyCard.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({Key? key, required this.onTap}) : super(key: key);

  //Confirm: もう少し正確な型をつけたい
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        MyCard(
          onTap: onTap,
          imageURL:
              'https://assets.media-platform.com/bi/dist/images/2021/03/19/black-w960.jpeg',
          title: 'Englister Free',
          category: 'free',
        ),
        MyCard(
          onTap: onTap,
          imageURL:
              'https://english.yunomy.com/static/category/it-interview.png',
          title: 'IT企業面接対策',
          category: 'it_interview',
        ),
      ],
    ));
  }
}
