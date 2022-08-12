import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/features/advers/data/models/adver_model/adver_model.dart';

class AdverListItem extends StatelessWidget {
  const AdverListItem({super.key, required this.item});

  final Items item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border(
            top: BorderSide(
              color: Colors.grey,width: 1
            ),
            bottom: BorderSide(
              color: Colors.grey,width: 1
            ),
            right: BorderSide(
              color: Colors.grey,width: 1
            ),
            left: BorderSide(
              color: Colors.grey,width: 1
            ),
           ),
        ),
        height: 200,
        child: ListTile(
         // leading: Text('${post.id}', style: textTheme.caption),
          title: Text(item.xAdvTitle!),
         // isThreeLine: true,
         // subtitle: Text(post.body),
         // dense: true,
        ),
      ),
    );
  }
}