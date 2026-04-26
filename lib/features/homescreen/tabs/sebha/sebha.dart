import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/resourses/color-manger/color-manager.dart';
import 'package:islami_app/core/resourses/imagemanger/image-manager.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  List<String>tasbehlist=["سبحان الله","الحمد لله","استغفر الله"];
 int count=0;
 int currentTasbehIndex=0;
 double turns=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage(ImageManager.sebha),
                fit: BoxFit.cover,

              )
          ),child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(ImageManager.islami_logo,),
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ", style: TextStyle(

            color: ColorManager.offwhite,
            fontSize: 36.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(ImageManager.sebha_head,height: 95.h,),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedRotation(
                        duration: Duration(milliseconds: 500),
                        turns: turns,
                        child:
                        InkWell(
                          onTap: (){
                            setState(() {
                              count++;
                              turns += (1 / 33);
                              if (count == 33) {
                                count = 0;
                                currentTasbehIndex =
                                    (currentTasbehIndex + 1) % tasbehlist.length;
                              }
                            });
                          },
                            child: Image.asset(ImageManager.sebha_body,height: 250.h,))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(tasbehlist[currentTasbehIndex], style: TextStyle(

                      color: ColorManager.offwhite,
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                    ),
                      textAlign: TextAlign.center,),
                        Text("${count}", style: TextStyle(

                          color: ColorManager.offwhite,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                        ),
                          textAlign: TextAlign.center,),

                      ],
                    )
                  ],
                ),

              ],
            ),
          )
        ],
      )
      )
      ,


    );
  }
}
