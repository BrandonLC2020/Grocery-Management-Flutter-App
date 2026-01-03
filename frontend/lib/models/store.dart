class Store {
  const Store({
    required this.id,
    required this.name,
    this.address,
    required this.tripCount,
    this.createdBy,
    this.updatedBy,
  });

  final int id;
  final String name;
  final String? address;
  final int tripCount;
  final int? createdBy;
  final int? updatedBy;
}
