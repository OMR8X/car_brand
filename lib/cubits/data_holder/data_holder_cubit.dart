import 'package:car_brand/services/brand_saver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/brands.dart';
import '../../models/brand.dart';

part 'data_holder_state.dart';

class DataHolderCubit extends Cubit<DataHolderState> {
  DataHolderCubit() : super(DataHolderLoading());
  late SharedPreferences sp;
  late List<Brand> holdedBrands;
  init() async {
    emit(DataHolderLoading());
    updat();
  }

  updat() async {
    holdedBrands = [];
    sp = await SharedPreferences.getInstance();
    for (Brand b in brandsDB) {
      b.saved = await BrandSaver().isSaved(b);
      holdedBrands.add(b);
    }
    emit(DataHolderInitial(brands: holdedBrands));
  }
  
}
