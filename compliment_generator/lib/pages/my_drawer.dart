import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imgUrl =
        "https://media.licdn.com/dms/image/C5603AQGSXHwe4gAF1g/profile-displayphoto-shrink_800_800/0/1637253449655?e=1697673600&v=beta&t=a3ntISyhMWtTFXxMKX7tztA4iOCv32WeNConYEdqdSY";
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFFF7373)),
              margin: EdgeInsets.zero,
              accountName: Text("Naincy Kumari"),
              accountEmail: Text("naincy112233@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imgUrl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.black,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.black,
            ),
            title: Text(
              "Profile",
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.book,
              color: Colors.black,
            ),
            title: Text(
              "Libraries",
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.black,
            ),
            title: Text(
              "Settings",
              textScaleFactor: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
