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
    name: "America",
    color: const Color(0xff90EBFF),
    imagePath: "assets/images/continent/america.svg",
  ),
  // Continent(
  //   name: "Africa",
  //   color: const Color(0xffFF90D9),
  //   imagePath: "assets/images/continent/africa.svg",
  // ),
  // Continent(
  //   name: "A3ustralia",
  //   color: const Color(0xffFFD990),
  //   imagePath: "assets/images/continent/australia.svg",
  // ),
];
