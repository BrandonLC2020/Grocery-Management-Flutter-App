import 'package:dart_mappable/dart_mappable.dart';
// We import the DTOs here to ensure they are part of the graph, 
// though 'InitializerScope.package' should find them regardless.
import 'package:grocery_management_frontend/networking/dto/dto.dart';

// IMPORTANT: This must match the filename (startup_services.dart -> startup_services.mapper.dart)
part 'startup_services.mapper.dart';

@MappableLib(generateInitializerForScope: InitializerScope.package)
void initializeAppServices() {
  // This function will be created in the generated .mapper.dart file
  initializeMappers();
}