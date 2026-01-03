from apps.budget.models import MonthlyBudget
from rest_framework import serializers

class BudgetSerializer(serializers.ModelSerializer):
    class Meta:
        model = MonthlyBudget
        fields = ['id', 'user', 'month', 'year', 'budget_amount']
        read_only_fields = ['id', 'user']