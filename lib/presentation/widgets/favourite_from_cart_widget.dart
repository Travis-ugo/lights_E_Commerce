// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class FavouriteFromCartWidget extends StatelessWidget {
  const FavouriteFromCartWidget({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color.fromRGBO(33, 33, 33, 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
        child: Icon(
          isSelected ? Icons.favorite : Icons.favorite_border,
          color: isSelected ? Colors.grey[900] : null,
        ),
      ),
    );
  }
}

