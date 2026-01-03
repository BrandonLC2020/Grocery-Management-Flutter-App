class PurchasedItem {
  const PurchasedItem({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.trip,
    required this.pantryItem,
    required this.purchasePrice,
    required this.quantityBought,
    this.createdBy,
    this.updatedBy,
  });

  final int id;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int trip;
  final int pantryItem;
  final double purchasePrice;
  final int quantityBought;
  final int? createdBy;
  final int? updatedBy;
}
