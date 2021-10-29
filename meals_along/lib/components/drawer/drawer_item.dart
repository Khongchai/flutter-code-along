import "package:flutter/material.dart";

class DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  static String currentPage = "";

  const DrawerItem(
      {Key? key, required this.title, required this.onTap, required this.icon})
      : super(key: key);

  void _navigate() {
    currentPage = title;
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    bool alreadyAtPageToNavigateTo = title == currentPage;

    return ListTile(
      onTap: alreadyAtPageToNavigateTo ? null : _navigate,
      leading: Icon(icon, size: 26),
      title: Text(title,
          style: TextStyle(
              fontFamily: "RobotoCondensed",
              fontSize: 24,
              color: alreadyAtPageToNavigateTo ? Colors.grey : Colors.black,
              fontWeight: FontWeight.bold)),
    );
  }
}
