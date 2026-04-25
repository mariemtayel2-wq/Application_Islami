import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/resourses/color-manger/color-manager.dart';
import 'package:islami_app/core/resourses/imagemanger/image-manager.dart';

class Hadithitem extends StatefulWidget {
  const Hadithitem({super.key, required this.index});

  final int index;
  @override
  State<Hadithitem> createState() => _HadithitemState();
}

class _HadithitemState extends State<Hadithitem> {
  String title = "";
  String content = "";
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    loadhadithcontent(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorManager.primary_color,
        image: DecorationImage(
          image: AssetImage(ImageManager.hadith_background),
        ),
      ),
      child: Column(
        children: [

         Stack(
           alignment: Alignment.center,
             children: [
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImageManager.left_corner,

                      color: ColorManager.black,
                    ),
                    Image.asset(
                      ImageManager.right_corner,

                      color: ColorManager.black,
                    ),
                  ],
                ),
               if (title.isNotEmpty)
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 12.w),
                   child: Text(
                     title,
                     textAlign: TextAlign.center,
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                     style: TextStyle(
                       fontSize: 20.sp,
                       fontWeight: FontWeight.bold,
                       color: ColorManager.black,
                     ),
                   ),
                 ),
             ],
           ),



          Expanded(
            child: SingleChildScrollView(
              child: errorMessage.isNotEmpty
                  ? Center(
                      child: Text(
                        errorMessage,
                        style: TextStyle(
                          color: ColorManager.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : content.isEmpty
                    ? Center(child: CircularProgressIndicator(color: ColorManager.black))
                    : Text(
                        content,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
            ),
          ),
           Image.asset(
              ImageManager.bottom_corner,

              color: ColorManager.black,
              fit: BoxFit.fitWidth,

          ),
        ],
      ),
    );
  }

  void loadhadithcontent(int index) async {
    try {
      final String filePath = "assets/files/Hadeeth/h${index + 1}.txt";
      final String fileContent = await rootBundle.loadString(filePath);
      final List<String> hadithlines = fileContent.trim().split("\n");
      final String hadithTitle = hadithlines.first;
      hadithlines.removeAt(0);
      final String hadithContent = hadithlines.join("\n");

      if (!mounted) return;
      setState(() {
        title = hadithTitle;
        content = hadithContent;
        errorMessage = "";
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        errorMessage = "Failed to load hadith";
      });
    }
  }
}
