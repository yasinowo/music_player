import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ), // Icon
            ), // Center
          ), // DrawerHeader

          // home tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25),
            child: ListTile(
              title: Text("H O M E"),
              leading: Icon(Icons.home), onLongPress: () {},
              // ...
            ), //
          ), //

          // settings tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: Text("S E T T I N G"),
              leading: Icon(Icons.home), onLongPress: () {},
              // ...
            ), // ListTile
          ),
        ],
      ), // Column
    ); // Drawer
  }
}
