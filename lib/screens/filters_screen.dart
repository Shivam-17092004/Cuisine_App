import 'package:cuisine_app/providers/filters_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
              title: Text(
                "Gluten-Free",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only includes gluten-free meals",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              value: activeFilters[Filter.glutenfree]!,
              onChanged: (isClicked) {
                ref
                    .watch(filtersProvider.notifier)
                    .setFilter(Filter.glutenfree, isClicked);
              }),
          SwitchListTile(
              title: Text(
                "Lactose-Free",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only includes lactose-free meals",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              value: activeFilters[Filter.lactosefree]!,
              onChanged: (isClicked) {
                ref
                    .watch(filtersProvider.notifier)
                    .setFilter(Filter.lactosefree, isClicked);
              }),
          SwitchListTile(
              title: Text(
                "Vegetarian",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only includes vegetarian meals",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isClicked) {
                ref
                    .watch(filtersProvider.notifier)
                    .setFilter(Filter.vegetarian, isClicked);
              }),
          SwitchListTile(
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                "Only includes vegan meals",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              value: activeFilters[Filter.vegan]!,
              onChanged: (isClicked) {
                ref
                    .watch(filtersProvider.notifier)
                    .setFilter(Filter.vegan, isClicked);
              })
        ],
      ),
    );
  }
}
