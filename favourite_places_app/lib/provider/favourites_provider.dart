import 'package:riverpod/riverpod.dart';

import 'package:favourite_places_app/model/places_model.dart';

class FavouritePlacesNotifier extends StateNotifier<List<Place>> { //StateNotifier(): for stateful widgets
  FavouritePlacesNotifier() : super([]);

  bool toggleMealFavouriteStatus(Place place) {
    final mealIsFavourite = state.contains(place);

    if (mealIsFavourite) {
      state = state.where((p) => p.id != place.id).toList();
      return false;
    } else {
      state = [...state, place];
      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouritePlacesNotifier, List<Place>>((ref) {
  return FavouritePlacesNotifier();
});