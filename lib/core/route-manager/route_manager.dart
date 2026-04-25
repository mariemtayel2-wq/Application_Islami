import 'package:flutter/material.dart';
import 'package:islami_app/features/homescreen/homescreen.dart';
import 'package:islami_app/features/introscreen/introscreen.dart';
import 'package:islami_app/features/suraditails/suraditail.dart';

abstract class RouteManager {
  static const String homeScreen="/home";
  static const String introScreen="/introScreen";
  static const String suraditails="/suraditails";

  static final Map<String,WidgetBuilder>routes={
    introScreen:(context)=> Introscreen(),
    homeScreen:(context)=> Homescreen(),
    suraditails:(context)=>Suraditail()
  };
}