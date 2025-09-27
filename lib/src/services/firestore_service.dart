import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/fost.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Récupère un flux de la liste des fosts pour un utilisateur donné.
  ///
  /// Ce flux se met à jour automatiquement lorsque les données changent dans Firestore.
  /// Il récupère les 'fosts' où l'utilisateur est soit le créateur (`creatorId`),
  /// soit l'autre partie impliquée (`otherPartyId`).
  Stream<List<Fost>> getFostsStream(String userId) {
    // Utilisation d'une requête 'OR' pour trouver les documents pertinents.
    // Note: Cela nécessite que les index composites soient créés automatiquement
    // par Firebase. Un lien d'erreur apparaîtra dans la console de débogage
    // la première fois pour créer cet index.
    final query = _db.collection('fosts').where(
      Filter.or(
        Filter('creatorId', isEqualTo: userId),
        Filter('otherPartyId', isEqualTo: userId)
      )
    ).orderBy('updatedAt', descending: true);

    // Écoute les changements sur cette requête
    return query.snapshots().map((snapshot) {
      // Pour chaque document dans le snapshot, on le convertit en objet Fost
      return snapshot.docs
          .map((doc) => Fost.fromJson(doc as QueryDocumentSnapshot<Map<String, dynamic>>))
          .toList();
    });
  }

  // Nous ajouterons ici plus tard les méthodes pour créer,
  // mettre à jour et supprimer des fosts.
}