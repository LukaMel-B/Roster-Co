import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityMenuItems {
  String title;
  IconData icon;

  ActivityMenuItems(this.title, this.icon);
}

final List<ActivityMenuItems> menuItems = [
  ActivityMenuItems('Done', FontAwesomeIcons.circleCheck),
  ActivityMenuItems('Delete', FontAwesomeIcons.solidTrashCan),
];
