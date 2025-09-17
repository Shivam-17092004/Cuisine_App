import 'package:cuisine_app/models/meal_blueprint.dart';
import 'package:cuisine_app/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({required this.meal, super.key});
  final Meal meal;
  @override
  Widget build(context, WidgetRef ref) {
    final isExisting = ref.watch(favoriteMealsProvider).contains(meal);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .watch(favoriteMealsProvider.notifier)
                  .addedToFavorite(meal, context);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween<double>(begin: 0.5, end: 1).animate(animation),
                child: child,
              ),
              child: Icon(
                isExisting ? Icons.star : Icons.star_border,
                key: ValueKey(isExisting),
              ),
            ),
          )
        ],
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              textAlign: TextAlign.center,
              "Ingredients",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 16,
            ),
            for (final list in meal.ingredients)
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  textAlign: TextAlign.center,
                  list,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            const SizedBox(
              height: 30,
            ),
            Text(
              textAlign: TextAlign.center,
              "Steps",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 16,
            ),
            for (final list in meal.steps)
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  textAlign: TextAlign.center,
                  list,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
