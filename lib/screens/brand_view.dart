import 'package:car_brand/models/brand.dart';
import 'package:car_brand/services/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BrandView extends StatelessWidget {
  const BrandView({super.key, required this.brand});
  final Brand brand;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        foregroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: BrandDetialsWidget(brand: brand),
          ),
          const SizedBox(height: 12),
          Text(
            "${"brand_cars_models".tr(context)} ${brand.name}",
            style: const TextStyle(fontFamily: "Almarai"),
          ),
          const SizedBox(height: 12),
          Expanded(
              child: ListView.builder(
            itemCount: brand.models.length,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CarModelWidget(name: brand.models[index])],
            ),
          ))
        ],
      ),
    );
  }
}

class CarModelWidget extends StatelessWidget {
  const CarModelWidget({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            _launchUrl("https://www.google.com/search?q=$name");
          },
          child: Center(
              child: Text(
            name,
            style: const TextStyle(fontFamily: "Almarai"),
          )),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}

class BrandDetialsWidget extends StatelessWidget {
  const BrandDetialsWidget({super.key, required this.brand});
  final Brand brand;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(nameToPath(brand),
                    filterQuality: FilterQuality.low),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              brand.name,
              style: const TextStyle(
                fontFamily: "Almarai",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${"brand_country_text".tr(context)} : ${brand.country} ",
              style: const TextStyle(
                fontFamily: "Almarai",
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
            Text(
              "${"brand_year_text".tr(context)} : ${brand.country} ",
              style: const TextStyle(
                fontFamily: "Almarai",
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  nameToPath(Brand brand) {
    return "assets/images/logo/${brand.name.replaceAll(" ", "_").replaceAll("-", "_").toLowerCase()}.png";
  }
}
