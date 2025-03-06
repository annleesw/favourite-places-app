import 'package:flutter/material.dart';

import 'package:favourite_places_app/model/places_model.dart';
import 'package:favourite_places_app/screens/places_details_screen.dart';

class PlacesList extends StatelessWidget{
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places yet, start adding some!',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
        title: Text(
          places[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        subtitle: Text(
          places[index].location.address,
          style:Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary
          ),
        ),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => PlacesDetailsScreen(place: places[index],),
          ),
        );
       },
      ) ,
    );
  }
}