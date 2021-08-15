import 'package:albums_route/routes.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  static bool _selected = false;

  void _toggleActive() {
    setState(() {
      _selected = !_selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 30),
        children: <Widget>[
          _createDrawerItem(
              text: 'Home',
              selected: !_selected,
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.home);
                if (_selected) {
                  _toggleActive();
                }
              }),
          _createDrawerItem(
              text: 'Artists',
              selected: _selected,
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.artists);
                if (!_selected) {
                  _toggleActive();
                }
              }),
        ],
      ),
    );
  }
}

Widget _createDrawerItem(
    {String text, bool selected, GestureTapCallback onTap}) {
  return ListTile(
    selected: selected,
    title: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
