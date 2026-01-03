class MonthlyBudget {
  const MonthlyBudget({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.month,
    required this.year,
    required this.budgetAmount,
    this.createdBy,
    this.updatedBy,
  });

  final int id;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int user;
  final int month;
  final int year;
  final double budgetAmount;
  final int? createdBy;
  final int? updatedBy;
}
