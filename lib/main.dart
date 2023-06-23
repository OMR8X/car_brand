import 'package:car_brand/cubits/data_holder/data_holder_cubit.dart';
import 'package:car_brand/screens/pick_continent_view.dart';
import 'package:car_brand/screens/start_view.dart';
import 'package:car_brand/services/app_localization.dart';
import 'package:car_brand/services/localization_provider.dart';
import 'package:car_brand/services/theme_provider.dart';
import 'package:car_brand/state/lang/lang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LangCubit()..getSavedLanguage(),
          ),
          BlocProvider(
            create: (context) => DataHolderCubit(),
          ),
        ],
        child: BlocBuilder<LangCubit, LangState>(
          builder: (context, state) {
            if (state is ChangeLocalState) {
              return MaterialApp(
                title: 'Cars Brands',
                supportedLocales: const [Locale("en"), Locale("ar")],
                localizationsDelegates:
                    LocalizationProvider().localizationsDelegates,
                localeResolutionCallback:
                    LocalizationProvider().localeResolutionCallback,
                theme: ThemeProvider().getCurrentTheme(),
                home: const StartView(),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
// t
