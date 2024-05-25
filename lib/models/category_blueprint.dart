import 'package:flutter/material.dart';

class MyCategory {
  const MyCategory(
      {required this.title, required this.id, this.color = Colors.orange});
  final String title;
  final String id;
  final Color color;
}
