import 'package:car_brand/models/brand.dart';
import 'package:car_brand/models/continent.dart';
import 'package:car_brand/screens/brand_view.dart';
import 'package:car_brand/services/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../cubits/data_holder/data_holder_cubit.dart';
import '../services/brand_saver.dart';
import '../services/custom_page_route.dart';

class PickBrandView extends StatelessWidget {
  const PickBrandView(
      {super.key, required this.continent, required this.brands});
  final Continent continent;
  final List<Brand> brands;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "brands_page_title".tr(context),
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: getChildren().length,
        itemBuilder: (context, index) =>
            BrandWidget(brand: getChildren()[index]),
      ),
    );
  }

  getChildren() {
    List<Brand> list = brands
        .where((element) => element.continent.contains(continent.name))
        .toList();
    return list;
  }
}

class BrandWidget extends StatelessWidget {
  const BrandWidget({super.key, required this.brand});
  final Brand brand;
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
              child: BrandView(brand: brand),
            ));
          },
          onLongPress: () {
            brand.saved ? BrandSaver().unSave(brand) : BrandSaver().save(brand);
            Fluttertoast.showToast(
              msg: brand.saved ? "saved".tr(context) : "unsaved".tr(context),
              gravity: ToastGravity.BOTTOM,
              textColor: Colors.black,
              backgroundColor: Theme.of(context).primaryColor,
              fontSize: 16.0,
            );
            context.read<DataHolderCubit>().updat();
          },
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
                style: const TextStyle(fontFamily: "Almarai"),
              ),
              const SizedBox(height: 2),
              Text(
                brand.country,
                style: TextStyle(
                  fontFamily: "Almarai",
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 9,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  nameToPath(Brand brand) {
    return "assets/images/logo/${brand.name.replaceAll(" ", "_").replaceAll("-", "_").toLowerCase()}.png";
  }
}
