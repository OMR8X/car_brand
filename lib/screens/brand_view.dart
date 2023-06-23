import 'package:car_brand/cubits/data_holder/data_holder_cubit.dart';
import 'package:car_brand/models/brand.dart';
import 'package:car_brand/services/app_localization.dart';
import 'package:car_brand/services/brand_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class BrandView extends StatefulWidget {
  const BrandView({super.key, required this.brand});
  final Brand brand;

  @override
  State<BrandView> createState() => _BrandViewState();
}

class _BrandViewState extends State<BrandView> {
  late bool isSaved;
  @override
  void initState() {
    isSaved = widget.brand.saved;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        foregroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: InkWell(
          onTap: () {
            setState(() {
              isSaved
                  ? BrandSaver().unSave(widget.brand)
                  : BrandSaver().save(widget.brand);
              isSaved = !isSaved;
            });
            Fluttertoast.showToast(
              msg: isSaved ? "saved".tr(context) : "unsaved".tr(context),
              gravity: ToastGravity.BOTTOM,
              textColor: Colors.black,
              backgroundColor: Theme.of(context).primaryColor,
              fontSize: 16.0,
            );
            context.read<DataHolderCubit>().updat();
          },
          child: Icon(isSaved ? Icons.remove : Icons.add),
        ),
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
            child: BrandDetialsWidget(brand: widget.brand),
          ),
          const SizedBox(height: 12),
          Text(
            "${"brand_cars_models".tr(context)} ${widget.brand.name}",
            style: const TextStyle(fontFamily: "Almarai"),
          ),
          const SizedBox(height: 12),
          Expanded(
              child: ListView.builder(
            itemCount: widget.brand.models.length,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CarModelWidget(name: widget.brand.models[index])],
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
            textAlign: TextAlign.center,
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
              "${"brand_year_text".tr(context)} : ${brand.date} ",
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
