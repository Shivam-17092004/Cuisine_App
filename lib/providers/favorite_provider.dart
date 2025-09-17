import 'package:cuisine_app/models/meal_blueprint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

class FavoriteProvider extends StateNotifier<List<Meal>> {
  FavoriteProvider() : super([]);

  void addedToFavorite(Meal meal, context) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite == false) {
      state = [...state, meal];
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Meal added to favorites.")));
    } else {
      state = state.where((mymeal) => mymeal.id != meal.id).toList();
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Meal no longer a favorite.")));
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteProvider, List<Meal>>(
        (ref) => FavoriteProvider());
