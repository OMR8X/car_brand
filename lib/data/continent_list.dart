import 'package:flutter/material.dart';

import '../models/continent.dart';

List<Continent> continents = [
  Continent(
    name: "Asia",
    color: const Color(0xff90FFAF),
    imagePath: "assets/images/continent/asia.svg",
  ),
  Continent(
    name: "Europe",
    color: const Color(0xffAD90FF),
    imagePath: "assets/images/continent/europe.svg",
  ),
  Continent(
    name: "South America",
    color: const Color.fromARGB(255, 255, 144, 144),
    imagePath: "assets/images/continent/south_america.svg",
  ),
  Continent(
    name: "North America",
    color: const Color(0xff90EBFF),
    imagePath: "assets/images/continent/north_america.svg",
  ),
  // Continent(
  //   name: "Africa",
  //   color: const Color(0xffFF90D9),
  //   imagePath: "assets/images/continent/africa.svg",
  // ),
  // Continent(
  //   name: "Australia",
  //   color: const Color(0xffFFD990),
  //   imagePath: "assets/images/continent/australia.svg",
  // ),
];
