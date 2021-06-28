import 'package:flutter/material.dart';

class Animal {
  String name;
  String scientificName;
  int age;
  String distanceToUser;
  String imageURL;
  bool isFemale;
  Color backgroundColor;

  Animal(this.name, this.scientificName, this.age, this.backgroundColor,
      this.distanceToUser, this.imageURL, this.isFemale);
}
