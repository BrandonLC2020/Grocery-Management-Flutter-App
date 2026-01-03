class GroceryTrip {
  const GroceryTrip({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.store,
    required this.tripDate,
    required this.totalSpent,
    this.createdBy,
    this.updatedBy,
  });

  final int id;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int user;
  final int store;
  final DateTime tripDate;
  final double totalSpent;
  final int? createdBy;
  final int? updatedBy;
}
