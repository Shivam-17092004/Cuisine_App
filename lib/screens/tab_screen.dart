import 'package:cuisine_app/providers/favorite_provider.dart';
import 'package:cuisine_app/screens/category_screen.dart';
import 'package:cuisine_app/screens/meal_screen.dart';
import 'package:cuisine_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  var currentIndex = 0;
  String currentTitle = "yo";
  void setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    Widget activeScreen = const CategoryScreen();
    if (currentIndex == 0) {
      activeScreen = const CategoryScreen();
      currentTitle = "Choose a category";
    }
    if (currentIndex == 1) {
      activeScreen = MealScreen(mealList: favoriteMeals);
      currentTitle = "Favorites";
    }
    return Scaffold(
        drawer: const MainDrawer(),
        appBar: AppBar(
          title: Text(currentTitle),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setCurrentIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
          ],
        ),
        body: activeScreen);
  }
}
