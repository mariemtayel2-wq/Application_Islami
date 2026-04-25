import 'package:flutter/material.dart';
import 'package:islami_app/core/resourses/imagemanger/image-manager.dart';

class Sebha extends StatelessWidget {
  const Sebha({super.key});

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
        ],)),

    );
  }
}
