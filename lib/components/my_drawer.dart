import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/pages/setting_page.dart';
import 'package:music_player/theme/text_style.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 40.sp,
                color: color.inversePrimary,
              ), // Icon
            ), // Center
          ), // DrawerHeader

          // home tile
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 25.h),
            child: ListTile(
              title: Text(
                "H O M E",
                style: drawerStyle.copyWith(color: color.primaryFixed),
              ),
              leading: Icon(
                Icons.home,
                size: 24.sp,
                color: color.primary,
              ),
              onTap: () {
                Navigator.pop(context);
              },
              // ...
            ), //
          ), //

          // settings tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: Text(
                "S E T T I N G S",
                style: drawerStyle.copyWith(color: color.primaryFixed),
              ),
              leading: Icon(
                Icons.settings,
                size: 24.sp,
                color: color.primary,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingPage(),
                    ));
              },
              // ...
            ), // ListTile
          ),
        ],
      ), // Column
    ); // Drawer
  }
}
