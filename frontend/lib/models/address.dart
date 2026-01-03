class Address {
  const Address({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.addressLine,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    this.createdBy,
    this.updatedBy,
  });

  final int id;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String addressLine;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final int? createdBy;
  final int? updatedBy;
}
