part of 'lang_cubit.dart';

@immutable
abstract class LangState {}

class LangInitial extends LangState {}

class ChangeLocalState extends LangState {
  final Locale locale;
  ChangeLocalState({
    required this.locale,
  });
}
