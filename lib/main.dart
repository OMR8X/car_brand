import 'package:car_brand/screens/pick_continent_view.dart';
import 'package:car_brand/services/app_localization.dart';
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
    return BlocProvider(
        create: (context) => LangCubit()..getSavedLanguage(),
        child: BlocBuilder<LangCubit, LangState>(
          builder: (context, state) {
            if (state is ChangeLocalState) {
              return MaterialApp(
                title: 'Cars Brands',
                // locale: state.locale,
                supportedLocales: const [Locale("en"), Locale("ar")],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var local in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == local.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                theme: ThemeData(
                  scaffoldBackgroundColor: const Color(0xffF6F6F6),
                  primaryColor: const Color(0xffFFFFFF),
                  appBarTheme: AppBarTheme(
                    backgroundColor: Color(0xffF6F6F6),
                    shadowColor: Colors.black.withOpacity(0.1),
                    surfaceTintColor: Color(0xffF6F6F6),
                    titleTextStyle: const TextStyle(
                      fontFamily: "Almarai",
                      fontSize: 23,
                      color: Colors.black,
                    ),
                  ),
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: const Color(0xff252525)),
                  useMaterial3: true,
                ),
                home: const PickContinentView(),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
// t
