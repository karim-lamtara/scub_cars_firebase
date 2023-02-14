import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'car.dart';

part 'cars.pod.g.dart';

final carsCollection = FirebaseFirestore.instance.collection("cars");
typedef Cars = Iterable<Car>;

@riverpod
Future<Cars> sourceCar(SourceCarRef ref) => carsCollection
    .get()
    .then((value) => value.docs.map((doc) => Car.fromFirebase(doc)));

Future<void> removeCar(Car car) => carsCollection
    .doc(car.id)
    .delete()
    .then((value) => null)
    .catchError((error) => print("Failed to delete car: $error"));

Future<void> addCar(Car car) =>
    carsCollection.add({'constructeur': car.constructeur});
