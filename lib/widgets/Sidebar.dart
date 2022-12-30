import 'package:flutter/material.dart';
import 'package:ugrr/colors.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: bgColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Divider(),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favourites'),
              onTap: () => null,
            )
          ],
        ));
  }
}
