import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final imageUrl =
      "https://www.google.com/url?sa=i&url=https%3A%2F%2Ftwitter.com%2Fiamjdpatel&psig=AOvVaw28OrRz8AEPxOiuu3vDaJ4M&ust=1616008739860000&source=images&cd=vfe&ved=2ahUKEwiyqrXow7XvAhUX_TgGHVLnDFwQjRx6BAgAEAc";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Jay Patel"),
              accountEmail: Text("iamjdpatel@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
            ),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
            ),
            title: Text("Profile"),
          )
        ],
      ),
    );
  }
}
