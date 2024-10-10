class Transactions {
  final int? keyID;
  final double amount;
  final DateTime date;
  final String Camp_name;
  final String Series;
  final String Name;
 

  Transactions({
    this.keyID,
    required this.Camp_name,
    required this.Series,
    required this.Name,
    required this.amount,
    required this.date,
  

  });
}