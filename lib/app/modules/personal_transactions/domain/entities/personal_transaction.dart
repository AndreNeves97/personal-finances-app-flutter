class PersonalTransaction {
  late final String id;
  final String title;
  final double value;
  final DateTime date;

  PersonalTransaction({
    required this.title,
    required this.value,
    required this.date,
  });
}
