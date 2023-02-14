import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pimp_my_dev/cars.pod.dart';
import 'package:logger/logger.dart';

import 'car.dart';
import 'firebase_options.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

void main() async {
  //Initialisation de firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
            body: ProviderScope(
                child: MyHomePage(
          title: '',
        ))));
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  build(context, ref) {
    TextEditingController _controllor = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: Column(children: [
          Row(children: [
            FloatingActionButton(
              heroTag: "btn1",
              //Enregistrer une nouvelle entité dans Firebase
              onPressed: () {
                if (_controllor.text != "") {
                  addCar(Car(constructeur: _controllor.text, id: ""));
                  _controllor.text = "";
                  //Raffrechir la vue
                  ref.refresh(sourceCarProvider);
                }
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 100),
            SizedBox(
              width: 50.0,
              child: TextField(
                controller: _controllor,
                maxLines: 1,
                maxLength: 10,
                keyboardType: TextInputType.text,
              ),
            ),
          ]),
          CarsWidget(ref: ref),
        ])));
  }
}

class CarsWidget extends StatelessWidget {
  const CarsWidget({super.key, required this.ref});
  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    final cars = ref.watch(sourceCarProvider);
    return cars.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => const Text('ERREUR'),
        data: (cars) {
          return Column(
              children:
                  cars.map((car) => CardCard(car: car, ref: ref)).toList());
        });
  }
}

class CardCard extends StatelessWidget {
  const CardCard({super.key, required this.car, required this.ref});

  final Car car;
  final WidgetRef ref;

  @override
  build(context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Card(
            color: const Color.fromARGB(255, 163, 201, 232),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(car.constructeur),
                FloatingActionButton(
                  onPressed: () {
                    removeCar(car);
                    ref.refresh(sourceCarProvider);
                  },
                  child: const Icon(Icons.delete),
                ),
              ]),
            ])));
  }
}

Future<void> removeCar(Car car) => carsCollection
    .doc(car.id)
    .delete()
    .then((value) => null)
    .catchError((error) => print("Failed to delete car: $error"));

Future<void> addCar(Car car) =>
    carsCollection.add({'constructeur': car.constructeur});
