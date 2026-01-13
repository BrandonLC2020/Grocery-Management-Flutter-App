import 'package:dart_mappable/dart_mappable.dart';
import 'package:grocery_management_frontend/networking/dto/purchased_item_dto.dart';

part 'grocery_trip_dto.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class GroceryTripDto with GroceryTripDtoMappable {
  const GroceryTripDto({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.store,
    required this.tripDate,
    required this.totalSpent,
    this.purchasedItems,
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
  final List<PurchasedItemDto>? purchasedItems;
  final int? createdBy;
  final int? updatedBy;

  static const fromMap = GroceryTripDtoMapper.fromMap;
  static const fromJson = GroceryTripDtoMapper.fromJson;
}
