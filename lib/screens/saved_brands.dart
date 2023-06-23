import 'package:car_brand/models/brand.dart';
import 'package:car_brand/screens/pick_brand_view.dart';
import 'package:car_brand/services/app_localization.dart';
import 'package:flutter/material.dart';

class SavedBrandsView extends StatefulWidget {
  const SavedBrandsView({super.key, required this.brands});
  final List<Brand> brands;

  @override
  State<SavedBrandsView> createState() => _SavedBrandsViewState();
}

class _SavedBrandsViewState extends State<SavedBrandsView> {
  List<Brand> saved = [];
  @override
  void initState() {
    initBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "saved_brands".tr(context),
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: saved.length,
        itemBuilder: (context, index) => BrandWidget(brand: saved[index]),
      ),
    );
  }

  void initBrands() {
    saved = widget.brands.where((element) => element.saved).toList();
  }
}
