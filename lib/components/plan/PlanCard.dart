import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  PlanCard(
      {Key? key,
      required this.title,
      required this.price,
      required this.description,
      required this.onTap})
      : super(key: key);
  String title;
  String price;
  String description;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 15, left: 15, top: 15),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: ListTile(
          contentPadding: EdgeInsets.all(20),
          title: Text(title,
              style: Typography.dense2018.headline5
                  ?.apply(color: Colors.blue[600], fontWeightDelta: 1)),
          subtitle: Text(description),
          trailing: Text(price),
        ),
      ),
    );
  }
}
