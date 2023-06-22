import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_brand/services/lang_cash_helpler.dart';
import 'package:flutter/material.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangInitial());

  Future<void> getSavedLanguage() async {
    final String cashedLanguageCode =
        await LangCashHelper().getCashedLanguageCode();
    emit(ChangeLocalState(locale: Locale(cashedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LangCashHelper().cashLanguageCode(languageCode);
    emit(ChangeLocalState(locale: Locale(languageCode)));
  }
}
