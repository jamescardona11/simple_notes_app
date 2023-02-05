import 'package:flutter/foundation.dart';

class AdapterDAO {
  AdapterDAO({
    this.id,
    required this.data,
  });

  final String? id;
  final Map<String, dynamic> data;

  @override
  bool operator ==(covariant AdapterDAO other) {
    if (identical(this, other)) return true;

    return other.id == id && mapEquals(other.data, data);
  }

  @override
  int get hashCode => Object.hashAll([id, data]);
}
