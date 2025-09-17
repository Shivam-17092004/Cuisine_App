import 'package:cuisine_app/models/meal_blueprint.dart';
import 'package:cuisine_app/widgets/meal_item.dart';
import 'package:flutter/material.dart';


class MealScreen extends StatelessWidget {
  const MealScreen({this.title, required this.mealList, super.key});
  final List<Meal> mealList;
  final String? title;
  @override
  Widget build(context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            "Uh..oh no meals found!",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            textAlign: TextAlign.center,
            "Try selecting a different category",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (mealList.isNotEmpty) {
      content = ListView.builder(
          itemCount: mealList.length,
          itemBuilder: (ctx, indx) {
            return MealItem(meal: mealList[indx]);
          });
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
