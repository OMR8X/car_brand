class Brand {
  final String name;
  final String country;
  final String continent;
  final String date;
  final List<String> models;
  //
  bool saved;
  //

  Brand({
    required this.name,
    required this.country,
    required this.continent,
    required this.models,
    required this.date,
    this.saved = false,
  });
}
