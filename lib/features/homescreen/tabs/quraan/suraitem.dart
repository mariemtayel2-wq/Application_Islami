import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/resourses/color-manger/color-manager.dart';
import 'package:islami_app/core/resourses/imagemanger/image-manager.dart';
import 'package:islami_app/core/route-manager/route_manager.dart';
import 'package:islami_app/model/suradetailsarguments.dart';
import 'package:islami_app/model/suramodel.dart';

class Suraitem extends StatelessWidget {
 Suraitem({super.key, required this.surahmodel, required this.index});
final SurahModel surahmodel;
final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RouteManager.suraditails,arguments: Suradetailsarguments(sura: surahmodel, index: index));
      },
      child: Container(
        child:Row(

          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(ImageManager.suraitemnumber,),
                Text("${surahmodel.number}",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.white,
                ),)
              ],
            ),
            SizedBox(width: 8.w,),
            Column(
              children: [
                Text(surahmodel.nameEn,style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.white,
                ),),
                Text("${surahmodel.ayahCount} Verses  ",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.white,
                ),),

              ],
            ),
            Spacer(),
            Text(surahmodel.nameAr,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorManager.white,
            ),)
          ],
        ),
      ),
    );
  }
}
