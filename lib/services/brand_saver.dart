import 'package:car_brand/models/brand.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BrandSaver {
  //
  Future<void> save(Brand brand) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(brand.name, true);
    return;
  }

  //
  Future<void> unSave(Brand brand) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setBool(brand.name, false);
    return;
  }

  //
  Future<bool> isSaved(Brand brand) async {
    final sp = await SharedPreferences.getInstance();
    bool res = sp.getBool(brand.name) ?? false;
    return res;
  }
}
