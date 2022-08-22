import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/utils/string_extension.dart';
import 'package:flutter_advanced_course/features/advers/data/models/adver_model/adver_model.dart';
import 'package:flutter_advanced_course/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
class AdverListItem extends StatelessWidget {
  const AdverListItem({super.key, required this.item});

  final Items item;

  @override
  Widget build(BuildContext context) {
    final value = new NumberFormat("#,##0", "fa_IR");
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Container(
       // margin: EdgeInsets.all(10),
        padding: EdgeInsetsDirectional.only(start: 10,end:10,top: 10,bottom: 10),
        decoration:  BoxDecoration(          
           // borderRadius: BorderRadius.circular(5),
            border:  Border(
              top: BorderSide(color: Colors.grey[300]!, width: 1),
              bottom: BorderSide.none,
              right:  BorderSide.none,
              left:  BorderSide.none,
            ),
            //color: Colors.red
            
            ),
        height:120,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.xAdvTitle!,style: context.read<ThemeBloc>().state.entity.theme!.textTheme!.headline1,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...item.specsStr!.map((e) => Text(e)),           
                  ],
                ),
               
              ],
            ),
            Container(
              color: Colors.grey[300],
              height: 100,
              width: 120,
              child: item.images == null || item.images!.isEmpty
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                 Icon(Icons.camera_alt,color:Colors.grey[600]!),
                 Text('بدون تصویر',)
                  ],)
                  : Image.network(
                      item.images!.first.xImage!,
                      fit: BoxFit.fill,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
