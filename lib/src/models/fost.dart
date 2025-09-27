import 'package:flutter/foundation.dart';
import 'fost_enums.dart';

@immutable
class Fost {
  final String id;
  final String description;
  final FostCategory category;
  final FostStatus status;
  final FostType type;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String creatorId;
  final String lastEditorId;
  final String? otherPartyId;
  final FostRole creatorRole;
  final List<String> deletedBy;

  const Fost({
    required this.id,
    required this.description,
    required this.category,
    required this.status,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.creatorId,
    required this.lastEditorId,
    this.otherPartyId,
    required this.creatorRole,
    this.deletedBy = const [],
  });
}