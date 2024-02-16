// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/favourite_from_cart_widget.dart';

class FavouriteSelectableWidget extends StatefulWidget {
  const FavouriteSelectableWidget({super.key});

  @override
  State<FavouriteSelectableWidget> createState() =>
      _FavouriteSelectableWidgetState();
}

class _FavouriteSelectableWidgetState extends State<FavouriteSelectableWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: FavouriteFromCartWidget(
        isSelected: isSelected,
      ),
    );
  }
}
