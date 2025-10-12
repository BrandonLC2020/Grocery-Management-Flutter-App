class ActiveModelsMixin:
    """
    Mixin to filter queryset to only include active models.
    """

    def get_queryset(self):
        queryset = super().get_queryset()
        return queryset.filter(active=True)
    
    def preform_destroy(self, instance):
        instance.active = False
        instance.save()