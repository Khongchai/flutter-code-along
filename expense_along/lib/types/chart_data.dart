class ChartData {
  final String day;
  final double amount;

  ChartData(this.day, this.amount);

  get prettyPrintedData {
    return "day: ${day.substring(0, 2)}, amount: $amount";
  }
}
