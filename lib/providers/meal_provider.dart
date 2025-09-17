import 'package:cuisine_app/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealProvider = Provider((ref) => dummyMeals);
