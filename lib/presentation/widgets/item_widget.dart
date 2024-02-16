
import 'package:flutter/material.dart';
import 'package:lights_on_heights_e_commerce_assessment/models/sales_item_model.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/item_image_holder_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/item_name_category_and_price_widget.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    this.onTap,
    required this.items,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Item items;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemImageHolderWidget(item: items),
            ItemNameCategoryAndPriceWidget(items: items),
          ],
        ),
      ),
    );
  }
}
