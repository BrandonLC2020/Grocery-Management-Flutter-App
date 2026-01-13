import 'package:grocery_management_frontend/models/monthly_budget.dart';
import 'package:grocery_management_frontend/networking/api/api_client.dart';
import 'package:grocery_management_frontend/networking/dto/monthly_budget_dto.dart';

class BudgetRepository {
  final ApiClient _apiClient;

  BudgetRepository({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  Future<MonthlyBudget> getMonthlyBudget(int year, int month) async {
    final response = await _apiClient.get('/api/budget/$year/$month/');
    final budgetDto = MonthlyBudgetDto.fromMap(response.data);
    return budgetDto.toMonthlyBudget();
  }

  Future<MonthlyBudget> setBudget(int year, int month, double amount) async {
    final response = await _apiClient.post('/api/budget/', data: {
      'year': year,
      'month': month,
      'budget_amount': amount,
    });
    final budgetDto = MonthlyBudgetDto.fromMap(response.data);
    return budgetDto.toMonthlyBudget();
  }
}

extension on MonthlyBudgetDto {
  MonthlyBudget toMonthlyBudget() {
    return MonthlyBudget(
      id: id,
      month: month,
      year: year,
      budgetAmount: budgetAmount,
    );
  }
}
