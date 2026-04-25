import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/resourses/color-manger/color-manager.dart';
import 'package:islami_app/core/resourses/imagemanger/image-manager.dart';

class ContainerMostresent extends StatelessWidget {
  const ContainerMostresent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
      width: 283.w,
      height: 150.h,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
        color: ColorManager.primary_color,

      ),
      child:
      Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Al-Anbiya",style: TextStyle(
                  color: ColorManager.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),),
                Text("الأنبياء",style: TextStyle(
                  color: ColorManager.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),),

                Text("112",style: TextStyle(
                  color: ColorManager.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),),


              ],
            ),
          ),
          Expanded(child: Image.asset(ImageManager.image_mostrecent )),
        ],
      ),

    );
  }
}
