import 'package:dart_mappable/dart_mappable.dart';

part 'monthly_budget_dto.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class MonthlyBudgetDto with MonthlyBudgetDtoMappable {
  const MonthlyBudgetDto({
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

  static const fromMap = MonthlyBudgetDtoMapper.fromMap;
  static const fromJson = MonthlyBudgetDtoMapper.fromJson;
}
