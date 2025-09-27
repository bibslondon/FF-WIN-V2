import 'package:flutter/material.dart';
import '../../../models/fost.dart';
import '../../../models/fost_enums.dart';

class FostCard extends StatelessWidget {
  final Fost fost;

  const FostCard({
    super.key,
    required this.fost,
  });

  // Fonction pour obtenir l'icône correspondant à la catégorie
  IconData _getCategoryIcon(FostCategory category) {
    switch (category) {
      case FostCategory.money:
        return Icons.monetization_on_outlined;
      case FostCategory.electronics:
        return Icons.devices_other_outlined;
      case FostCategory.books:
        return Icons.book_outlined;
      case FostCategory.clothing:
        return Icons.checkroom_outlined;
      case FostCategory.tools:
        return Icons.build_outlined;
      case FostCategory.kitchen:
        return Icons.kitchen_outlined;
      case FostCategory.gaming:
        return Icons.gamepad_outlined;
      case FostCategory.services:
        return Icons.support_agent_outlined;
      default:
        return Icons.category_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
          foregroundColor: Theme.of(context).primaryColor,
          child: Icon(_getCategoryIcon(fost.category)),
        ),
        title: Text(
          fost.description,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            // Met en majuscule la première lettre et remplace les underscores
            'Status: ${fost.status.name[0].toUpperCase()}${fost.status.name.substring(1).replaceAll('_', ' ')}',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // La navigation vers les détails sera implémentée plus tard
        },
      ),
    );
  }
}