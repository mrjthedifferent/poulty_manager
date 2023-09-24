import 'dart:convert';

extension MapToJson on Map<String, dynamic> {
  /// Converts a map to a json string
  String toJson() => json.encode(this);
}
