import 'package:flutter/material.dart';
import 'package:islami_app/core/resourses/imagemanger/image-manager.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage(ImageManager.radio),
                fit: BoxFit.cover,

              )
          ),child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(ImageManager.islami_logo,),
        ],)),

    );
  }
}
