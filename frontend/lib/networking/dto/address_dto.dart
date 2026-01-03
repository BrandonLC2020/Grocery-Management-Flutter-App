import 'package:dart_mappable/dart_mappable.dart';

part 'address_dto.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class AddressDto with AddressDtoMappable {
  const AddressDto({
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

  static const fromMap = AddressDtoMapper.fromMap;
  static const fromJson = AddressDtoMapper.fromJson;
}
