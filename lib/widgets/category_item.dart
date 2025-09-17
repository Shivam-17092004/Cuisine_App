import 'package:cuisine_app/models/category_blueprint.dart';
import 'package:cuisine_app/models/meal_blueprint.dart';
import 'package:cuisine_app/providers/filters_provider.dart';
import 'package:cuisine_app/screens/meal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CategoryItem extends ConsumerWidget {
  const CategoryItem({required this.category, super.key});
  final MyCategory category;

  void goToMealScreen(context, List<Meal> mealsMulti, MyCategory category) {
    final changedMeal = mealsMulti
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            MealScreen(title: category.title, mealList: changedMeal)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredMeals = ref.watch(filteredMealsProvider);
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        goToMealScreen(context, filteredMeals, category);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.33),
            category.color.withOpacity(0.77),
            category.color.withOpacity(0.99),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
