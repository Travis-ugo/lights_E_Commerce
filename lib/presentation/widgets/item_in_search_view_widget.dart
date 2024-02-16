import 'package:flutter/material.dart';
import 'package:lights_on_heights_e_commerce_assessment/models/sales_item_model.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/item_image_holder_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/item_name_category_and_price_widget.dart';

class ItemInSearchViewWidget extends StatelessWidget {
  const ItemInSearchViewWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemImageHolderWidget(
              iconPosition: IconPosition.leading,
              height: 120,
              width: 130,
              item: item,
            ),
            const SizedBox(width: 15),
            Column(
              children: [
                ItemNameCategoryAndPriceWidget(items: item),
                ElevatedButton(
                  onPressed: () {},
                  key: const Key('explore'),
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    foregroundColor: Colors.grey[900],
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    minimumSize: const Size(100, 35),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
