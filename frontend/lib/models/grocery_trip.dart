class GroceryTrip {
  const GroceryTrip({
    required this.id,
    required this.store,
    required this.tripDate,
    required this.totalSpent,
    this.createdBy,
    this.updatedBy,
  });

  final int id;
  final int store;
  final DateTime tripDate;
  final double totalSpent;
  final int? createdBy;
  final int? updatedBy;
}
