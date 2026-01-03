class MonthlyBudget {
  const MonthlyBudget({
    required this.id,
    required this.month,
    required this.year,
    required this.budgetAmount,
    this.createdBy,
    this.updatedBy,
  });

  final int id;
  final int month;
  final int year;
  final double budgetAmount;
  final int? createdBy;
  final int? updatedBy;
}
