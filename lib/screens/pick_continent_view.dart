import 'package:car_brand/data/continent_list.dart';
import 'package:car_brand/models/continent.dart';
import 'package:car_brand/screens/pick_brand_view.dart';
import 'package:car_brand/services/app_localization.dart';
import 'package:car_brand/services/custom_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PickContinentView extends StatelessWidget {
  const PickContinentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "continents_page_title".tr(context),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: continents.length,
        itemBuilder: (context, index) => ContinentWidget(
          continent: continents[index],
        ),
      ),
    );
  }
}

class ContinentWidget extends StatelessWidget {
  const ContinentWidget({super.key, required this.continent});
  final Continent continent;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).primaryColor,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.of(context).push(CustomPageRoute(
              child: PickBrandView(continent: continent),
            ));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  continent.imagePath,
                  width: MediaQuery.of(context).size.width / 4.5,
                  colorFilter:
                      ColorFilter.mode(continent.color, BlendMode.srcIn),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                continent.name.tr(context),
                style: const TextStyle(fontFamily: "Almarai"),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
