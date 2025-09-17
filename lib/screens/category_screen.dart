import 'package:cuisine_app/data/dummy_data.dart';
import 'package:cuisine_app/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
        lowerBound: 0,
        upperBound: 1);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: [
              for (final category in availableCategories)
                CategoryItem(category: category)
            ],
          ),
        ),
        builder: (context, child) => SlideTransition(
              position:
                  Tween(begin: const Offset(0, 0.8), end: const Offset(0, 0))
                      .animate(CurvedAnimation(
                          parent: animationController,
                          curve: Curves.easeInOut)),
              child: child,
            ));
  }
}
