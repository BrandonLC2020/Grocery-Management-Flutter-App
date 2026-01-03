class Category {
  const Category({
    required this.id,
    required this.name,
    this.description,
    this.createdBy,
    this.updatedBy,
  });

  final int id;
  final String name;
  final String? description;
  final int? createdBy;
  final int? updatedBy;
}
