import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/core/route-manager/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  final prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('intro_seen') ?? false;
  runApp(IslamiApp(seen: seen,));

}

class IslamiApp extends StatelessWidget {
  final bool seen;
 const IslamiApp({super.key,required this.seen});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_ , child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:RouteManager.routes ,
      initialRoute:seen?RouteManager.homeScreen:RouteManager.introScreen,
    )
    );
  }
}
