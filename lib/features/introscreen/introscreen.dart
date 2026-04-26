import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/core/resourses/imagemanger/image-manager.dart';
import 'package:islami_app/core/route-manager/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Introscreen extends StatefulWidget {


  const Introscreen({super.key});


  static PageViewModel buildPage({
    required String image,
    required String title,
    required String body,
  }) {
    return PageViewModel(
      titleWidget: const SizedBox( ),

      bodyWidget: Builder(
        builder: (context) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;

              final logoWidth = (width * 0.58).clamp(150.0, 300.0).toDouble();
              final mainImageWidth = (width * 0.85).clamp(230.0, 520.0).toDouble();
              final mainImageHeight = (height * 0.34).clamp(150.0, 330.0).toDouble();
              final titleSize = (width * 0.06).clamp(20.0, 32.0).toDouble();
              final bodySize = (width * 0.04).clamp(14.0, 20.0).toDouble();
              final sectionGap = (height * 0.03).clamp(12.0, 28.0).toDouble();
              final textGap = (height * 0.015).clamp(8.0, 16.0).toDouble();
              final horizontalPadding = (width * 0.08).clamp(16.0, 48.0).toDouble();

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: sectionGap * 0.5),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: height * 0.9),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          ImageManager.islami_logo,
                          width: logoWidth,
                        ),

                        SizedBox(height: sectionGap),

                        Image.asset(
                          image,
                          width: mainImageWidth,
                          height: mainImageHeight,
                          fit: BoxFit.contain,
                        ),

                        SizedBox(height: sectionGap),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xffE2BE7F),
                              fontSize: titleSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        SizedBox(height: textGap),

                        if (body.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                            child: Text(
                              body,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xffE2BE7F),
                                fontSize: bodySize,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),


      decoration: const PageDecoration(
        pageColor: Colors.transparent,
      ),
    );
  }

  @override
  State<Introscreen> createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {
  final List<PageViewModel> listPagesViewModel = [
    Introscreen.buildPage(
      image: 'assets/images/intro1.png',
      title: 'Welcome To Islami App',
      body: '',
    ),
    Introscreen.buildPage(
      image: 'assets/images/intro2.png',
      title: 'Reading the Quran',
      body: 'We Are Very Excited To Have You In Our Community',
    ),
    Introscreen.buildPage(
      image: 'assets/images/intro3.png',
      title: 'Reading the Quran',
      body: 'Read, and your Lord is the Most Generous',
    ),
    Introscreen.buildPage(
      image: 'assets/images/intro4.png',
      title: 'Tasbeeh',
      body: 'Praise the name of your Lord, the Most High',
    ),
    Introscreen.buildPage(
      image: 'assets/images/intro5.png',
      title: 'Holy Quran Radio',
      body:
      'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      body: SafeArea(
        child: IntroductionScreen(
          pages: listPagesViewModel,
          showNextButton: true,
          showDoneButton: true,
          showSkipButton: true,
          controlsPadding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 12.h),
          next: const Text(
            "Next",
            style: TextStyle(color: Color(0xffE2BE7F)),
          ),
          showBackButton: true,
          back: const Text(
            "Back",
            style: TextStyle(color: Color(0xffE2BE7F)),
          ),
          globalBackgroundColor: const Color(0xff202020),
          dotsDecorator: DotsDecorator(
            size: Size(8.r, 8.r),
            activeSize: Size(22.w, 8.h),
            color: Colors.grey,
            activeColor: Color(0xffE2BE7F),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),

          done: const Text(
            "Done",
            style: TextStyle(color: Color(0xffE2BE7F)),
          ),

          onDone: () async {
            final navigator = Navigator.of(context);
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('intro_seen', true);
            if (!mounted) return;
            navigator.pushReplacementNamed(RouteManager.homeScreen);
          },
          skip: const Text(
            "Skip",
            style: TextStyle(color: Color(0xffE2BE7F)),
          ),
          onSkip: () async {
            final navigator = Navigator.of(context);
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('intro_seen', true);
            if (!mounted) return;
            navigator.pushReplacementNamed(RouteManager.homeScreen);
          },

        ),
      ),
    );
  }
}