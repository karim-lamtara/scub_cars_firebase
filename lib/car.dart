import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  const Car({required this.constructeur, required this.id});
  final String constructeur;
  final String id;

//Genere un objet Car a partir d'un DocumentSnapshot
  factory Car.fromFirebase(DocumentSnapshot doc) =>
      Car(id: doc.id, constructeur: doc['constructeur']);
}
