class Brand {
  final String name;
  final String country;
  final String continent;
  final String date;
  List<String> models;

  Brand({
    required this.name,
    required this.country,
    required this.continent,
    this.models = const [],
    required this.date,
  });
}
