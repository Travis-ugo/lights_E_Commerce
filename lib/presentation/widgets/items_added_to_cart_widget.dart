// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/bloc/commerce/commerce_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/models/sales_items_dto_model.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/item_image_holder_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/item_name_category_and_price_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/item_selcted_count_add_or_minus_widget.dart';

class ItemsAddedToCartWidget extends StatelessWidget {
  const ItemsAddedToCartWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  final ItemDTO item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ItemImageHolderWidget(
          iconPosition: IconPosition.leading,
          height: 120,
          width: 130,
          item: item.item,
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemNameCategoryAndPriceWidget(items: item.item),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<CommerceBloc, CommerceState>(
                  builder: (context, state) {
                    return IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        context
                            .read<CommerceBloc>()
                            .add(RemoveItemFromCartEvent(item.item));
                      },
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        size: 30,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 20),
                const ItemSelctedCountAddOrMinusWidget(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
