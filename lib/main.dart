import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/model/playlist_provider.dart';
import 'package:music_player/pages/home_page.dart';
import 'package:music_player/test.dart';
import 'package:music_player/theme/light_mod.dart';
import 'package:music_player/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => PlaylistProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          //  navigatorKey: globalKey,
          title: 'title',
          // You can use the library anywhere in the app even in theme
          theme: Provider.of<ThemeProvider>(context).themeData,
          home: child,
          routes: {},
        );
      },
      child: HomePage(),
    );
  }
}
