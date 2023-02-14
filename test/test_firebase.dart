import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pimp_my_dev/car.dart';
import 'package:pimp_my_dev/cars.pod.dart';
import 'package:pimp_my_dev/firebase_options.dart';
import 'package:flutter_test/flutter_test.dart';

CollectionReference carsCollection =
    FirebaseFirestore.instance.collection("cars");

Future<void> addCar(Car car) =>
    carsCollection.add({'constructeur': car.constructeur});

Future<void> removeCar(Car car) => carsCollection
    .doc(car.id)
    .delete()
    .then((value) => print("car Deleted"))
    .catchError((error) => print("Failed to delete car: $error"));

Future<void> main() async {
  print("0000steep0");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final container = ProviderContainer();

  final result = await container.read(sourceCarProvider.future);

  for (Car car in result) print(car.constructeur);

  final cars = await selectCarBy("constructeur", "test");
  for (Car car in cars) {
    removeCar(car);
  }

  addCar(Car(constructeur: "test", id: ""));
}

Future<Iterable<Car>> selectCarBy(String champ, String condition) async {
  final query = await carsCollection.where(champ, isEqualTo: condition).get();
  final cars = query.docs.map((doc) => Car.fromFirebase(doc));
  return cars;
}
