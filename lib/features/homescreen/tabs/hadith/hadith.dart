import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/resourses/imagemanger/image-manager.dart';
import 'package:islami_app/features/homescreen/tabs/hadith/hadithitem.dart';

class Hadith extends StatelessWidget {
  const Hadith({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageManager.hadith),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(ImageManager.islami_logo),

              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.h,
                    aspectRatio: 16 / 9,
                    viewportFraction: .7,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: List.generate(50, (index) => index).map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return  Hadithitem(index: i);
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
