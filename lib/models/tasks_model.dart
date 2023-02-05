// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

@immutable
class Task {
  final String title;
  final String description;
  final bool isDeleted;
  final bool isDone;
  final String id;

  const Task({
    required this.id,
    required this.title,
    this.description = '',
    this.isDeleted = false,
    this.isDone = false,
  });

  factory Task.create({
    required String title,
    String description = '',
  }) =>
      Task(
        id: const Uuid().v4(),
        title: title,
        description: description,
      );

  Task copyWith({
    String? title,
    String? description,
    bool? isDeleted,
    bool? isDone,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isDeleted: isDeleted ?? this.isDeleted,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.isDeleted == isDeleted &&
        other.isDone == isDone &&
        other.id == id;
  }

  @override
  int get hashCode {
    return title.hashCode ^ description.hashCode ^ isDeleted.hashCode ^ isDone.hashCode ^ id.hashCode;
  }
}
