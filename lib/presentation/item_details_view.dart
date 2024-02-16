// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/bloc/commerce/commerce_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/models/sales_item_model.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/my_cart_view.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/expandable_button_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/favourite_selectable_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/filter_selectable_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/sales_cart_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/title_and_subtitle_widget.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.brown.shade100,
                child: PageView.builder(
                  itemCount: item.itemImages.length,
                  itemBuilder: (builder, index) => Image(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      "assets/sales_image/${item.itemImages[3]}.jpeg",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: TitleAndSubTitleWidget(
                  title: item.itemName,
                  subTitle: item.itemCategory,
                  titleFontWeight: FontWeight.w900,
                  titleFontSize: 22,
                  subTitleFontSize: 12,
                  subTitleFontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  r"$" "${item.itemPrice}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Reviews",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Digitalizing historical such as preservation, I'll provide an overview of the background, significance, and procedure for digitalizing histor",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Select size",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    for (var i = 0; i < 3; i++)
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: FilterSelectableWidget(fontSize: 14, filterTitle: 'M',),
                      ),
                  ],
                ),
              ),
            ],
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(),
                SalesCartWidget(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                children: [
                  const FavouriteSelectableWidget(),
                  const SizedBox(width: 10),
                  ExpandableButtonWidget(
                    isFilled: false,
                    buttonTitle: BlocBuilder<CommerceBloc, CommerceState>(
                      builder: (context, state) {
                        return const Row(
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Add to cart',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    onTap: () {
                      context
                          .read<CommerceBloc>()
                          .add(AddItemToCartEvent(item: item));
                    },
                  ),
                  const SizedBox(width: 10),
                  ExpandableButtonWidget(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyCartView(),
                        ),
                      );
                    },
                    buttonTitle: const Text(
                      'check out',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
