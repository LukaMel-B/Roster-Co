import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItems {
  String title;
  IconData icon;

  MenuItems(this.title, this.icon);
}

final List<MenuItems> menuItems = [
  MenuItems('Done', FontAwesomeIcons.circleCheck),
  MenuItems('Delete', FontAwesomeIcons.solidTrashCan),
];
