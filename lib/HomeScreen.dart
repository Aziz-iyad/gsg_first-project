import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'brain.dart';
import 'animalDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color mainColor = Color.fromRGBO(48, 96, 96, 1.0);
  Color startColor = Color.fromRGBO(70, 112, 112, 1.0);
  int selectedAnimalIconIndex = 0;

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  List<Animal> animals = [
    Animal('Sola', 'Abyssinian cat', 2, Color.fromRGBO(203, 213, 216, 1.0),
        '3.5 Km', 'images/sola.png', true),
    Animal('Orion', 'Abyssinian cat', 1, Color.fromRGBO(237, 214, 180, 1.0),
        '7.8 Km', 'images/cat.png', false),
    Animal('yzan', 'Doberman dog', 22, Color.fromRGBO(85, 107, 47, 1.0),
        '6.5 Km', 'images/aborakan.png', false),
  ];

  List<String> animalTypes = [
    'Cats',
    'Dogs',
    'Parrots',
    'Fish',
    'Fish',
  ];

  List<IconData> animalIcons = [
    FontAwesomeIcons.cat,
    FontAwesomeIcons.dog,
    FontAwesomeIcons.crow,
    FontAwesomeIcons.fish,
    FontAwesomeIcons.fish,
  ];

  Widget buildAnimalIcon(int index) {
    return Padding(
      padding: EdgeInsets.only(right: 30),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectedAnimalIconIndex = index;
              });
            },
            child: Material(
              color:
                  selectedAnimalIconIndex == index ? startColor : Colors.white,
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Icon(
                  animalIcons[index],
                  size: 30,
                  color: selectedAnimalIconIndex == index
                      ? Colors.white
                      : mainColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            animalTypes[index],
            style: TextStyle(
              color: mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    // final Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
      ),
      duration: Duration(milliseconds: 250),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        child: Container(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? FlatButton(
                          child: Icon(
                            FontAwesomeIcons.bars,
                          ),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.menu_outlined),
                          onPressed: () {
                            setState(() {
                              yOffset = 150;
                              xOffset = 250;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          }),
                  Column(
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 20, color: mainColor.withOpacity(0.8)),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: startColor,
                          ),
                          Text(
                            'Kyiv,',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black87.withOpacity(0.7),
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Ukraine',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('images/avatar.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 20.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.search,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: TextField(
                                style: TextStyle(fontSize: 18.0),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: 'Search pets to adopt'),
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.filter,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 120.0,
                      child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: 24.0,
                            top: 8.0,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: animalTypes.length,
                          itemBuilder: (context, index) {
                            return buildAnimalIcon(index);
                          }),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: animals.length,
                          itemBuilder: (context, index) {
                            final animal = animals[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AnimalDetailScreen()));
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: 30, right: 20, left: 20),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Material(
                                      borderRadius: BorderRadius.circular(20),
                                      elevation: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 100,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${animal.name}',
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          color: startColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: deviceWidth * 0.22,
                                                    ),
                                                    Icon(
                                                      animal.isFemale
                                                          ? FontAwesomeIcons
                                                              .venus
                                                          : FontAwesomeIcons
                                                              .mars,
                                                      size: 23,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  animal.scientificName,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '${animal.age} years old',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color:
                                                          Colors.grey.shade600),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.location_on_sharp,
                                                      color: startColor,
                                                      size: 16,
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text(
                                                      'Distance : ${animal.distanceToUser}',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors
                                                            .grey.shade600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 210,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: animal.backgroundColor,
                                          ),
                                          width: deviceWidth * 0.41,
                                        ),
                                        Image(
                                          image: AssetImage(animal.imageURL),
                                          height: 230,
                                          width: deviceWidth * 0.42,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
