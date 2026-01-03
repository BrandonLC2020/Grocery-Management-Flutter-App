import 'package:flutter/services.dart';
import 'dart:convert';

class AppConfig {
  static Map<String, dynamic> _config = {};

  static Future<void> load(String env) async {
    try {
      final String configString = await rootBundle.loadString('assets/config/$env.json');
      _config = json.decode(configString);
    } catch (e) {
      print('Warning: Could not load config for $env. Using defaults.');
      // Initialize with defaults if needed
    }
  }

  static dynamic get(String key) => _config[key];
}