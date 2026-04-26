import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/prefsmanger/prefsmanger.dart';
import 'package:islami_app/core/resourses/color-manger/color-manager.dart';
import 'package:islami_app/features/homescreen/tabs/quraan/container-mostresent.dart';
import 'package:islami_app/features/homescreen/tabs/quraan/constantmanger.dart';
import 'package:islami_app/model/suramodel.dart';

class Mostrecentlist extends StatelessWidget {
  Mostrecentlist({super.key});

  final Constantmanger constantmanger = Constantmanger();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
      future: Prefsmanger.getMostRecentSura(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 130.h,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final List<int> recentIndexes = snapshot.data ?? [];
        final List<SurahModel> mostrecent = recentIndexes
            .map((index) => constantmanger.surahList[index])
            .toList();

        if (mostrecent.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          spacing: 5.h,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Most Recently ",
              style: TextStyle(
                color: ColorManager.offwhite,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 130.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ContainerMostresent(
                  sura: mostrecent[index],
                ),
                separatorBuilder: (context, index) => SizedBox(width: 14.w),
                itemCount: mostrecent.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
