import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favourite_places_app/widget/places_list.dart';
import 'package:favourite_places_app/screens/add_places.dart';
import 'package:favourite_places_app/provider/user_places_provider.dart';

class PlacesScreen extends ConsumerStatefulWidget{
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() {
    return _PlacesScreenState();
  }
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    ref.read(userPlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaces = ref.watch(userPlacesProvider);

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _placesFuture,
          builder: (context, snapshot) => 
            snapshot.connectionState == ConnectionState.waiting 
              ? const Center(child: CircularProgressIndicator(),) 
              : PlacesList(places: userPlaces),
        ),
      ),
    );
  }
}