// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/filter_from_category_widget.dart';

class FilterSelectableWidget extends StatefulWidget {
  const FilterSelectableWidget({
    Key? key,
    this.fontSize,
    required this.filterTitle,
  }) : super(key: key);

  final double? fontSize;
  final String filterTitle;

  @override
  State<FilterSelectableWidget> createState() => _FilterSelectableWidgetState();
}

class _FilterSelectableWidgetState extends State<FilterSelectableWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: FilterFromCategoryWidget(
        isSelected: isSelected,
        fontSize: widget.fontSize,
        filterTitle: widget.filterTitle,
      ),
    );
  }
}
