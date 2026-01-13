import 'package:grocery_management_frontend/models/purchased_item.dart';

class GroceryTrip {
  const GroceryTrip({
    required this.id,
    required this.store,
    required this.tripDate,
    required this.totalSpent,
    this.purchasedItems,
    this.createdBy,
    this.updatedBy,
  });

  final int id;
  final int store;
  final DateTime tripDate;
  final double totalSpent;
  final List<PurchasedItem>? purchasedItems;
  final int? createdBy;
  final int? updatedBy;
}
