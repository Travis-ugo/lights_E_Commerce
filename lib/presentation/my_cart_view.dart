import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/bloc/commerce/commerce_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/category_title_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/check_out_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/item_on_wish_list_widget.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/widgets/items_added_to_cart_widget.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CommerceBloc, CommerceState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    BackButton(),
                    SizedBox(width: 30),
                    Text(
                      "My Cart",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Icon(Icons.favorite_border),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.cartItems.length,
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ItemsAddedToCartWidget(
                      item: state.cartItems[index],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CategoryTitleWidget(
                    categoryTitle: 'Make your wish list come true',
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 135,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.salesItemDTO.items.length,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: ItemOnWishListWidget(),
                      );
                    },
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverToBoxAdapter(
                  child: CheckOutWidget(
                    total: state.totalPrice,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
