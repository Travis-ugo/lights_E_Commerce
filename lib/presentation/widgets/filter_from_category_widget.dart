// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class FilterFromCategoryWidget extends StatelessWidget {
  const FilterFromCategoryWidget({
    Key? key,
    this.fontSize = 16,
    required this.isSelected,
    required this.filterTitle,
  }) : super(key: key);

  final bool isSelected;
  final String filterTitle;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[900] : null,
        borderRadius: BorderRadius.circular(5),
        border:
            Border.all(color: Color.fromARGB(255, 150, 150, 150), width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Center(
          child: Text(
            filterTitle,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: fontSize,
              color: isSelected ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
