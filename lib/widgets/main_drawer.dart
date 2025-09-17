import 'package:cuisine_app/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  void selectFilters(context) {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const FilterScreen()));
  }

  @override
  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.tertiary.withOpacity(0.33),
                Theme.of(context).colorScheme.tertiary.withOpacity(0.77),
                Theme.of(context).colorScheme.tertiary.withOpacity(0.99),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: ListTile(
              leading: Icon(
                Icons.fastfood,
                size: 46,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              title: Text("Cooking Up!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
            },
            leading: const Icon(
              Icons.restaurant,
              size: 24,
            ),
            title: Text("Meals",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          ),
          ListTile(
              onTap: () {
                selectFilters(context);
              },
              leading: const Icon(
                Icons.settings,
                size: 24,
              ),
              title: Text("Filters",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground))),
        ],
      ),
    );
  }
}
