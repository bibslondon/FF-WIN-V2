import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'fost_enums.dart';

// Helper pour convertir les enums en String et vice-versa
T enumFromString<T>(List<T> values, String value) {
  return values.firstWhere((v) => v.toString().split('.').last == value);
}

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

  // Convertit un document Firestore en instance de Fost
  factory Fost.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Fost(
      id: doc.id,
      description: data['description'] ?? '',
      category: enumFromString(FostCategory.values, data['category'] ?? 'other'),
      status: enumFromString(FostStatus.values, data['status'] ?? 'draft'),
      type: enumFromString(FostType.values, data['type'] ?? 'solo'),
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      creatorId: data['creatorId'] ?? '',
      lastEditorId: data['lastEditorId'] ?? '',
      otherPartyId: data['otherPartyId'],
      creatorRole: enumFromString(FostRole.values, data['creatorRole'] ?? 'other'),
      deletedBy: List<String>.from(data['deletedBy'] ?? []),
    );
  }

  // Convertit une instance de Fost en Map pour Firestore
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'category': category.name,
      'status': status.name,
      'type': type.name,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'creatorId': creatorId,
      'lastEditorId': lastEditorId,
      'otherPartyId': otherPartyId,
      'creatorRole': creatorRole.name,
      'deletedBy': deletedBy,
    };
  }
}