class Store {
  const Store({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.name,
    this.address,
    required this.tripCount,
    this.createdBy,
    this.updatedBy,
  });

  final int id;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int user;
  final String name;
  final String? address;
  final int tripCount;
  final int? createdBy;
  final int? updatedBy;
}
