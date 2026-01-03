import 'package:grocery_management_frontend/networking/dto/dto.dart';

class StartupServices {
  static void startServices() {
    initMappers();
  }

  /// Sets up mappers for all DTO's so they can be used in a static context.
  /// Adapted for the Grocery Management App DTOs.
  static void initMappers() {
    UserDtoMapper.ensureInitialized();
    AddressDtoMapper.ensureInitialized();
    MonthlyBudgetDtoMapper.ensureInitialized();
    StoreDtoMapper.ensureInitialized();
    GroceryTripDtoMapper.ensureInitialized();
    PurchasedItemDtoMapper.ensureInitialized();
    CategoryDtoMapper.ensureInitialized();
    PantryItemDtoMapper.ensureInitialized();
  }
}