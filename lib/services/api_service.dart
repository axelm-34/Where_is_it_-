import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ApiService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Envoi de l'annonce vers Firestore
  Future<void> uploadAd(AdModel ad) async {
    try {
      await _db.collection('annonces').doc(ad.id).set(ad.toMap());
      print("Annonce transmise avec succès !");
    } catch (e) {
      print("Erreur de transmission : $e");
      rethrow;
    }
  }

  // Optionnel : Récupérer toutes les annonces pour les afficher plus tard
  Stream<List<AdModel>> getAds() {
    return _db.collection('annonces')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => AdModel.fromMap(doc.data()))
        .toList());
  }
}