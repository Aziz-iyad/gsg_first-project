import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Color mainColor = Color.fromRGBO(48, 96, 96, 1.0);
  Color startColor = Color.fromRGBO(70, 112, 112, 1.0);
  int selectedMenuIndex = 0;

  List<String> menuItems = [
    'Adoption',
    'Donation',
    'Add pet',
    'Favourite',
    'Messages',
    'Profile'
  ];
  List<IconData> menuIcons = [
    FontAwesomeIcons.paw,
    FontAwesomeIcons.home,
    FontAwesomeIcons.plus,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.envelope,
    FontAwesomeIcons.userAlt,
  ];

  Widget buildMenuRow(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMenuIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
        child: Row(
          children: [
            Icon(
              menuIcons[index],
              color: selectedMenuIndex == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              menuItems[index],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: selectedMenuIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [startColor, mainColor]),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 27, horizontal: 17),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black45,
                    backgroundImage: AssetImage('images/avatar.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AZIZ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Active statues',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: menuItems
                    .asMap()
                    .entries
                    .map((mapEntry) => buildMenuRow(mapEntry.key))
                    .toList(),
              ),
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'settings  |  log out ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
