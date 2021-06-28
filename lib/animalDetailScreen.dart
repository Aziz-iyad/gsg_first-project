import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'brain.dart';

class AnimalDetailScreen extends StatelessWidget {
  Color mainColor = Color.fromRGBO(48, 96, 96, 1.0);
  Color startColor = Color.fromRGBO(70, 112, 112, 1.0);

  final Animal animal = Animal('Sola', 'Abyssinian cat', 2,
      Color.fromRGBO(203, 213, 216, 1.0), '3.5 Km', 'images/sola.png', true);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Stack(children: [
                Container(
                  height: deviceHeight / 2,
                  color: mainColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(FontAwesomeIcons.arrowLeft)),
                            Icon(CupertinoIcons.share),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 100),
                  child: Container(
                    height: deviceHeight / 2.4,
                    child: Image(
                      image: AssetImage('images/sola.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ]),
              Expanded(
                  child: Container(
                color: startColor.withOpacity(0.03),
                child: Column(
                  children: [
                    SizedBox(height: 75),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Row(
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
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Owner',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: deviceWidth / 2.7,
                          ),
                          Text(
                            'May 25 , 2020',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'My job requires moving to another country. I don\'t have the opportunity to take the cat with me. I am looking for good people who will shelter Sola.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              Container(
                height: 125,
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(20),
                        color: mainColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(20),
                          color: mainColor,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Adoption',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 135,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${animal.name}',
                            style: TextStyle(
                                fontSize: 30,
                                color: startColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            animal.isFemale
                                ? FontAwesomeIcons.venus
                                : FontAwesomeIcons.mars,
                            size: 30,
                            color: mainColor,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            animal.scientificName,
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey.shade600),
                          ),
                          Text(
                            '${animal.age} years old',
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: startColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Address',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
