
import 'package:flutter/material.dart';
import 'package:lights_on_heights_e_commerce_assessment/models/sales_item_model.dart';

class ItemNameCategoryAndPriceWidget extends StatelessWidget {
  const  ItemNameCategoryAndPriceWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  final Item items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(
            items.itemName,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: 3),
          Text(
            items.itemCategory,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            r"$" "${items.itemPrice}",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
