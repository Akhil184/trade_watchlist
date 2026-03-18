class Stock {
  final String name;
  final String exchange;
  final double price;
  final double change;
  final double percentage;

  const Stock({
    required this.name,
    required this.exchange,
    required this.price,
    required this.change,
    required this.percentage,
  });
}