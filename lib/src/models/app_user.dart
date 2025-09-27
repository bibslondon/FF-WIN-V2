import 'package:flutter/foundation.dart';

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
}