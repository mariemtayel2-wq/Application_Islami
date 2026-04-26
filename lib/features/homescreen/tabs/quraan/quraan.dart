import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/resourses/color-manger/color-manager.dart';
import 'package:islami_app/core/resourses/imagemanger/image-manager.dart';
import 'package:islami_app/core/widget/custumtextfieled.dart';
import 'package:islami_app/features/homescreen/tabs/quraan/constantmanger.dart';
import 'package:islami_app/features/homescreen/tabs/quraan/mostrecentlist.dart';

import 'suraitem.dart';

class Quraan extends StatefulWidget {

  Quraan({super.key});

  @override
  State<Quraan> createState() => _QuraanState();
}

class _QuraanState extends State<Quraan> {
  final Constantmanger constantmanger = Constantmanger();

  List<int>filterlist=List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
        body: Container(
           decoration: BoxDecoration(
             image:DecorationImage(
                 image: AssetImage(ImageManager.quran),
               fit: BoxFit.cover,

             )
           ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 2.h),
            child: Column(
              spacing: 5.h,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(ImageManager.islami_logo,),
                CustumTextfieled(
                  onChange: (text)
                  {
                  serachFunction(text);
                  },
                  labelText: "Sura Name",
                 imageIcon:ImageIcon(AssetImage(IconManager.quran)),

                ),


                Mostrecentlist(),

                Text("Suras List", style: TextStyle(

                  color: ColorManager.offwhite,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                  textAlign: TextAlign.start,),

                Expanded(child: ListView.separated(
                    itemBuilder: (context, index) =>
                        Suraitem(
                      surahmodel: constantmanger.surahList[filterlist[index]],index: filterlist[index],
                      onTap: () => setState(() {}),
                    ),
                    separatorBuilder: (context, index) =>Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 5.h),
                      child: Divider(
                        color: ColorManager.white,
                        indent: 30.w,
                        endIndent: 30.w,
                        thickness: 1.h,
                      ),
                    ),
                    itemCount: filterlist.length),)
              ],
            ),
          ),
        ),
    );
  }

  void serachFunction(String text)
  {
    List<int>filtersearchlist=[];
   for(int i=0;i<constantmanger.surahList.length;i++)
     {
       if(constantmanger.surahList[i].nameEn.toLowerCase().contains(text.toLowerCase())
           ||constantmanger.surahList[i].nameAr.toLowerCase().contains(text.toLowerCase()))
         {
           filtersearchlist.add(i);
         }
     }

    filterlist=filtersearchlist;
    setState(() {});

}
}
