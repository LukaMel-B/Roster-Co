import 'package:flutter/material.dart';
import 'package:roster_co/constants/popmenu_activity_class.dart';

class ActivityListCard extends StatefulWidget {
  final String title;
  final IconData icon;
  const ActivityListCard({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  State<ActivityListCard> createState() => _ActivityListCardState();
}

class _ActivityListCardState extends State<ActivityListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: SizedBox(
        child: Container(
          padding: const EdgeInsets.only(top: 4, left: 15, bottom: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                spreadRadius: 4,
                offset: Offset(7, 7),
                blurRadius: 12,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 34,
                color: (widget.icon == Icons.bookmark_added_rounded)
                    ? const Color.fromARGB(255, 255, 187, 188)
                    : const Color(0xffDDF4A9),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 165,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: .5,
                      color: Color.fromARGB(255, 152, 152, 152),
                      fontFamily: 'Metropolis Medium'),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: SizedBox(
                  height: 45,
                  child: PopupMenuButton(
                    //color: Colors.yellow,
                    icon: Image.asset('assets/icons/menu_icon.png'),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    itemBuilder: (context) {
                      return menuItems.map(
                        (ActivityMenuItems menu) {
                          return PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(
                                  menu.icon,
                                  size: 23,
                                  color: Colors.black45,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(menu.title)
                              ],
                            ),
                          );
                        },
                      ).toList();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
