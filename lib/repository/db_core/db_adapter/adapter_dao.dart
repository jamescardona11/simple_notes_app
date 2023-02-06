// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class AdapterDAO {
  AdapterDAO({
    this.id,
    required this.data,
  });

  final String? id;
  final Map<String, dynamic> data;

  AdapterDAO formatData() {
    final id = _recordId();
    return AdapterDAO(
      id: id,
      data: _formatData(id),
    );
  }

  Map<String, dynamic> _formatData(String recordId) {
    final temp = Map<String, dynamic>.from(data);
    temp['id'] = recordId;

    return temp;
  }

  String _recordId() {
    if (id == null || id!.isEmpty) {
      return const Uuid().v4();
    }
    return id!;
  }

  @override
  bool operator ==(covariant AdapterDAO other) {
    if (identical(this, other)) return true;

    return other.id == id && mapEquals(other.data, data);
  }

  @override
  int get hashCode => Object.hashAll([id, data]);
}
