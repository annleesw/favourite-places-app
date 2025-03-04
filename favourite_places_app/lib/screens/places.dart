import 'package:favourite_places_app/widget/places_list.dart';
import 'package:favourite_places_app/screens/add_places.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget{
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const AddPlaceScreen()));
            }, 
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: PlacesList(
        places: []
      ),
    );
  }
}