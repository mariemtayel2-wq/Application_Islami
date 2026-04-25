import 'package:flutter/material.dart';
import 'package:islami_app/core/resourses/imagemanger/image-manager.dart';

import '../../core/resourses/color-manger/color-manager.dart';
import 'tabs/hadith/hadith.dart';
import 'tabs/quraan/quraan.dart';
import 'tabs/radio/radio.dart';
import 'tabs/sebha/sebha.dart';
import 'tabs/time/time.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Widget>tabs=[
    Quraan(),
    const Hadith(),
    const Sebha(),
    const RadioTab(),
    const Time(),
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.black,

bottomNavigationBar: BottomNavigationBar(
  onTap: (index){
    setState(() {
      selectedIndex=index;
    });
  },
  currentIndex: selectedIndex,
  backgroundColor: ColorManager.primary_color,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: ColorManager.white,
    unselectedItemColor: Colors.black,

    showUnselectedLabels: false,
    showSelectedLabels: true,

    items:[
      BottomNavigationBarItem(icon: _buildicon( IconManager.quran,selectedIndex==0),label: "Quran"),
      BottomNavigationBarItem(icon:  _buildicon(IconManager.hadith, selectedIndex==1),label: "Hadith"),
      BottomNavigationBarItem(icon: _buildicon(IconManager.sebha, selectedIndex==2),label: "Tasbeeh"),
      BottomNavigationBarItem(icon:  _buildicon(IconManager.radio, selectedIndex==3),label: "Radio"),
      BottomNavigationBarItem(icon:  _buildicon(IconManager.time, selectedIndex==4),label: "Time"),
    ] ),
      body: tabs[selectedIndex],
    );
  }
}
Widget _buildicon( String icon,bool selected)
{
  return
  selected?Container(
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: ColorManager.black.withOpacity(0.6),

    ),
      child: ImageIcon(AssetImage( icon))):ImageIcon(AssetImage(icon)
  );
}