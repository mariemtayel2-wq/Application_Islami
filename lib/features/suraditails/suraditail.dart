// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/prefsmanger/prefsmanger.dart';
import 'package:islami_app/core/resourses/color-manger/color-manager.dart';
import 'package:islami_app/core/resourses/imagemanger/image-manager.dart';
import 'package:islami_app/model/suradetailsarguments.dart';

class Suraditail extends StatefulWidget {
 Suraditail({super.key});

  @override
  State<Suraditail> createState() => _SuraditailState();
}

class _SuraditailState extends State<Suraditail> {
String content="";
bool _loaded = false;

  @override
  Widget build(BuildContext context) {
  Suradetailsarguments suradetailsarguments=ModalRoute.of(context)!.settings.arguments as Suradetailsarguments;
    if (!_loaded) {
      _loaded = true;
      Prefsmanger.saveLastindexSura(suradetailsarguments.index);
      loadsuracontent(suradetailsarguments.index);
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme:IconThemeData(
            color: ColorManager.primary_color
        ) ,
        backgroundColor: ColorManager.black,
        centerTitle: true,
        title: Text(suradetailsarguments.sura.nameEn, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
          color: ColorManager.primary_color
        ),),
      ),
      backgroundColor: ColorManager.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Image.asset(ImageManager.left_corner),
               Text(suradetailsarguments.sura.nameAr,style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20.sp,
                   color: ColorManager.primary_color
               ),),
               Image.asset(ImageManager.right_corner)
             ],
            ),
          ),
          Expanded(child: SingleChildScrollView(
             child: Padding(
               padding: EdgeInsets.all(16.w),
               child: content.isEmpty
                   ?
               CircularProgressIndicator(color: ColorManager.primary_color,)
                   :
                   Text(content, textDirection: TextDirection.rtl, style: TextStyle(
                     fontSize: 24.sp,
                     fontWeight: FontWeight.bold,
                     color: ColorManager.primary_color)),
             )
          )),
          Image.asset(ImageManager.bottom_corner)

        ],
      ),


    );
  }

  void loadsuracontent(int index)async
  {
    String file_path="assets/files/Suras/${index+1}.txt";
    String file_content=await rootBundle.loadString(file_path);

    
    List<String>suracontent= file_content.trim().split("\n");
for(int i=0;i<suracontent.length;i++)
  {
      suracontent[i]+="[${i+1}]";
  }
  content=suracontent.join();
  setState(() {

    });
  }
  
}
