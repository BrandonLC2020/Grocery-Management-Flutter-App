class PantryItem {
  const PantryItem({
    required this.id,
    required this.name,
    this.category,
    required this.quantity,
    required this.regularPrice,
    required this.lastUpdated,
    this.upc,
    this.brand,
    this.imageUrl,
    this.createdBy,
    this.updatedBy,
  });

  final int id;
  final String name;
  final int? category;
  final int quantity;
  final double regularPrice;
  final DateTime lastUpdated;
  final String? upc;
  final String? brand;
  final String? imageUrl;
  final int? createdBy;
  final int? updatedBy;
}
