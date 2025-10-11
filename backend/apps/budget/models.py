from backend.apps.generic.models import DefaultModel
from django.db import models
from backend.config import settings


class MonthlyBudget(DefaultModel):
    """
    Defines a user's grocery budget for a specific month and year.
    """
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    month = models.PositiveIntegerField()
    year = models.PositiveIntegerField()
    budget_amount = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        unique_together = ('user', 'month', 'year')

    def __str__(self):
        return f"Budget for {self.user.username} - {self.month}/{self.year}"
