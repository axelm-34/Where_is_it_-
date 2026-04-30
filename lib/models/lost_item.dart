import 'package:cloud_firestore/cloud_firestore.dart';

class AdModel {
  final String id;
  final String userId;
  final String description;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final DateTime createdAt;

  AdModel({
    required this.id,
    required this.userId,
    required this.description,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
  });

  // Transforme l'objet en Map pour l'envoyer à Firebase (Transmission)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'description': description,
      'imageUrl': imageUrl,
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': createdAt,
    };
  }

  // Crée un objet à partir des données reçues de Firebase
  factory AdModel.fromMap(Map<String, dynamic> map) {
    return AdModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      latitude: (map['latitude'] as num).toDouble(),
      longitude: (map['longitude'] as num).toDouble(),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}