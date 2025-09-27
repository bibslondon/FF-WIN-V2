import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@immutable
class AppUser {
  final String id;
  final String name;
  final String avatarUrl;

  const AppUser({
    required this.id,
    required this.name,
    this.avatarUrl = '',
  });

  // Convertit un document Firestore en instance de AppUser
  factory AppUser.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return AppUser(
      id: doc.id,
      name: data['name'] ?? 'Utilisateur Anonyme',
      avatarUrl: data['avatarUrl'] ?? '',
    );
  }

  // Convertit une instance de AppUser en Map pour Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatarUrl': avatarUrl,
    };
  }
}